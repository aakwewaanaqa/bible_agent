import 'package:bible_agent/helpers/ponito/fluent.dart';
import 'package:bible_agent/helpers/ponito/widgets.dart';
import 'package:bible_agent/models/bible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class BookSearch extends StatefulWidget {
  const BookSearch({super.key});

  @override
  State<StatefulWidget> createState() => _BookSearchState();
}

class _Model {
  final input = ('').toState();
  final index = (-1).toState();
  final suggestionLength = (0).toState();
}

class _Bloc {
  final model = _Model();
  final node = FocusNode();
  final scrollController = ScrollController();
  static const double itemHeight = 40.0;

  late final textController = () {
    final controller = TextEditingController();
    controller.addListener(() {
      model.input.value = controller.text;
      model.index.value = -1;
    });
    return controller;
  }();

  void scrollToIndex(
    int index, {
    Duration duration = const Duration(milliseconds: 200),
  }) {
    if (scrollController.hasClients) {
      final position = scrollController.position;
      final minScroll = position.minScrollExtent;
      final maxScroll = position.maxScrollExtent;
      final viewportHeight = position.viewportDimension;

      final itemTop = index * itemHeight;
      final itemBottom = itemTop + itemHeight;

      final currentScroll = scrollController.offset;
      final viewBottom = currentScroll + viewportHeight;

      double? targetScroll;

      if (itemTop < currentScroll) {
        // Item is above the visible area
        targetScroll = itemTop;
      } else if (itemBottom > viewBottom) {
        // Item is below the visible area
        targetScroll = itemBottom - viewportHeight;
      }

      if (targetScroll != null) {
        // Clamp the scroll value
        targetScroll = targetScroll.clamp(minScroll, maxScroll);

        scrollController.animateTo(
          targetScroll,
          duration: duration,
          curve: Curves.easeInOut,
        );
      }
    }
  }

  KeyEventResult onKeyEvent(FocusNode n, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final duration = event is KeyRepeatEvent
        ? const Duration(milliseconds: 50)
        : const Duration(milliseconds: 200);

    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      final nextIndex = model.index.value + 1;
      if (nextIndex < model.suggestionLength.value) {
        model.index.value = nextIndex;
        scrollToIndex(nextIndex, duration: duration);
      }
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      final prevIndex = model.index.value - 1;
      if (prevIndex >= 0) {
        model.index.value = prevIndex;
        scrollToIndex(prevIndex, duration: duration);
      }
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}

class _BookSearchState extends State<BookSearch> {
  final bloc = _Bloc();

  Widget buildSuggestions() {
    return [bloc.model.input, bloc.model.index].build(
      builder: (ctx, vals) {
        final input = vals[0] as String;
        final index = vals[1] as int;

        if (input.isEmpty) {
          return const SizedBox.shrink();
        }

        return BibleBookKey.bookKeys
            .where((k) {
              return k.displayString.toLowerCase().contains(
                input.toLowerCase(),
              );
            })
            .mapI((i, k) {
              final isSelected = i == index;
              final selectedColor = CupertinoColors.systemBlue;
              final defaultColor = CupertinoColors.label;
              final color = isSelected ? selectedColor : defaultColor;
              return k.displayString
                  .text(color: color)
                  .pad(padding: const EdgeInsets.symmetric(horizontal: 16))
                  .container(
                    height: _Bloc.itemHeight,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? selectedColor.withOpacity(0.2)
                          : CupertinoColors.systemBackground,
                    ),
                  );
            })
            .toList()
            .let((l) {
              bloc.model.suggestionLength.value = l.length;
              return l;
            })
            .listView(controller: bloc.scrollController)
            .expand();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    final barbg = theme.barBackgroundColor;
    return [
      CupertinoSearchTextField(
        focusNode: bloc.node,
        controller: bloc.textController,
        decoration: BoxDecoration(color: CupertinoColors.systemGrey4),
      ).focus(onKeyEvent: bloc.onKeyEvent),
      buildSuggestions(),
    ].column();
  }
}

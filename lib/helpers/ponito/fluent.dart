import 'index.dart';

extension FluentExt<T> on T {
  ValueNotifier<T> toState() {
    return ValueNotifier(this);
  }
}

extension ValueNotfierExt<T> on ValueNotifier<T> {
  Widget build({
    required Widget Function(BuildContext, T, Widget?) builder,
    Widget? child,
  }) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: builder,
      child: child,
    );
  }
}

extension ValueNotfiersExt on List<ValueNotifier> {
  Widget build({
    required Widget Function(BuildContext, List<dynamic>) builder,
  }) {
    Widget recursiveBuild(List<ValueNotifier> notifiers, List<dynamic> vals) {
      if (notifiers.length > 1) {
        return notifiers.first.build(
          builder: (_, val, _) {
            return recursiveBuild(notifiers.sublist(1), [...vals, val]);
          },
        );
      } else {
        return notifiers.first.build(
          builder: (ctx, val, _) {
            return builder(ctx, [...vals, val]);
          },
        );
      }
    }

    return recursiveBuild(this, []);
  }
}

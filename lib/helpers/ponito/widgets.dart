import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

extension StringExt on String {
  Widget text({Color? color}) {
    final style = color != null ? TextStyle(color: color) : null;
    return Text(this, style: style);
  }
}

typedef OnKeyEvent = KeyEventResult Function(FocusNode, KeyEvent);

extension WidgetExt on Widget {
  GestureDetector gesture() {
    return GestureDetector(child: this);
  }

  MouseRegion hover({
    PointerEnterEventListener? onEnter,
    PointerExitEventListener? onExit,
    PointerHoverEventListener? onHover,
  }) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      onHover: onHover,
      child: this,
    );
  }

  SingleChildScrollView scrollable() {
    return SingleChildScrollView(child: this);
  }

  Expanded expand() {
    return Expanded(child: this);
  }

  Container container({
    Decoration? decoration,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
  }) {
    return Container(
      decoration: decoration,
      width: width,
      height: height,
      alignment: alignment,
      child: this,
    );
  }

  Padding pad({EdgeInsetsGeometry? padding}) {
    return Padding(padding: padding ?? EdgeInsets.all(8.0), child: this);
  }

  Focus focus({OnKeyEvent? onKeyEvent}) {
    return Focus(onKeyEvent: onKeyEvent, child: this);
  }
}

extension WidgetsExt on List<Widget> {
  ListView listView({ScrollController? controller}) {
    return ListView(controller: controller, children: this);
  }

  Column column() {
    return Column(children: this);
  }

  Row row() {
    return Row(children: this);
  }
}

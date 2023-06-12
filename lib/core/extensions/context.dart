import 'package:flutter/material.dart';
import 'package:track_me/configs/app_layout.dart';

extension BuildContextX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double? get iconSize => IconTheme.of(this).size;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double responsive(double size, {Axis axis = Axis.vertical}) {
    final currentSize =
        axis == Axis.horizontal ? screenSize.width : screenSize.height;
    final designSize = axis == Axis.horizontal
        ? AppLayout.designScreenSize.width
        : AppLayout.designScreenSize.height;

    return size * currentSize / designSize;
  }
}

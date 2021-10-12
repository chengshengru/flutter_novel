import 'package:flutter/material.dart';

class ReaderAnimationHelper {
  late Offset currentTouchOffset;

  late BasePageAnimation animation;

  ReaderAnimationHelper(this.currentTouchOffset, BasePageAnimation animation);

  Canvas draw(Canvas canvas) {
    return canvas;
  }
}

abstract class BasePageAnimation {
  void draw(Canvas canvas);
}

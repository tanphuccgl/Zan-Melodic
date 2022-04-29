import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

extension LoopModeExt on LoopMode {
  IconData iconOf() {
    switch (this) {
      case LoopMode.off:
        return Icons.disabled_by_default_outlined;

      case LoopMode.one:
        return Icons.repeat_one_sharp;

      case LoopMode.all:
        return Icons.repeat;

      default:
        return Icons.disabled_by_default_outlined;
    }
  }

  LoopMode nextOption() {
    switch (this) {
      case LoopMode.off:
        return LoopMode.one;

      case LoopMode.one:
        return LoopMode.all;

      case LoopMode.all:
        return LoopMode.off;

      default:
        return LoopMode.all;
    }
  }
}

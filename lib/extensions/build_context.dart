import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  Future<T?> pushNamed<T extends Object?>(String route) {
    return Navigator.of(this).pushNamed<T>(route);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
}

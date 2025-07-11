import 'package:flutter/material.dart';

extension NavigatorExtension<T> on BuildContext {
  Future<T?> pushNamed(String route) async =>
      await Navigator.of(this).pushNamed(route);

  void pop() => Navigator.of(this).pop();
}

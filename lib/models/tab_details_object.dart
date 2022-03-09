import 'package:flutter/material.dart';

class TabDetailsObject {
  final int index;
  final Widget widget;
  final String? title;
  final IconButton? leftButton, rightButton;

  bool get showAppBar => title != null;

  Widget get getLeftButton =>
      leftButton ??
      const Placeholder(
          fallbackHeight: 1, fallbackWidth: 1, color: Colors.transparent);

  Widget get getRightButton =>
      rightButton ??
      const Placeholder(
          fallbackHeight: 1, fallbackWidth: 1, color: Colors.transparent);

  TabDetailsObject(
      {required this.index,
      required this.widget,
      this.title,
      this.leftButton,
      this.rightButton});
}

import 'package:flutter/widgets.dart';

export 'package:personal_financial_management/domain/models/user.dart';
export 'package:personal_financial_management/domain/models/models.dart';
// all models are exported, so you can use them in any file without importing them explicitly

class MainView {
  String? key;
  String view;
  String title;
  Widget widget;
  Widget? icon;
  Color? color;

  MainView(
    this.key,
    this.view,
    this.title,
    this.widget, {
    this.icon,
    this.color,
  });
}

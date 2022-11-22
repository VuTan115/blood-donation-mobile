import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/pages/home/home_view.dart';
import 'package:personal_financial_management/app/pages/login_page.dart';
import 'package:personal_financial_management/app/pages/statistic/statistic_view.dart';

class StatisticRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const StatisticRoute({Key? key, this.arguments, required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/home/subscreen':
                callback(key: 'home', view: 'subscreen', title: 'subscreen');
                return LoginPage();
              default:
                callback(key: 'home', view: 'main', title: 'Home');
                return StatisticView();
            }
          },
        );
      },
    );
  }
}

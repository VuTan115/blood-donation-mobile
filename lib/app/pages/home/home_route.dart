import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/pages/home/home_view.dart';
import 'package:personal_financial_management/app/pages/login_page.dart';

class HomeRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const HomeRoute({Key? key, this.arguments, required this.callback})
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
              case '/homeKey/detail':
                callback(key: 'homeSub', view: 'subscreen', title: 'subscreen');
                return HomeView();
              default:
                callback(key: 'homeKey', view: 'main', title: 'Home');
                return HomeView();
            }
          },
        );
      },
    );
  }
}

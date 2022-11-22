import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:personal_financial_management/app/pages/login_page.dart';
import 'package:personal_financial_management/app/routes/app_routes.dart';
import 'package:personal_financial_management/app/utils/global_key.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  NavigatorState get _navigator => GlobalKeys.appNavigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    const providerConfigs = [
      EmailProviderConfiguration(),
      GoogleProviderConfiguration(
          clientId:
              '515065352774-b6hmuepptkp59r8bchj2oa9ptghbfsa2.apps.googleusercontent.com')
    ];
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/' : '/home',
      routes: {
        '/': (context) {
          return SignInScreen(
            providerConfigs: providerConfigs,
            sideBuilder: (context, provider) {
              return const LoginPage();
            },
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                _navigator.pushNamedAndRemoveUntil(
                  AppRoute.home,
                  (Route<dynamic> route) => false,
                );
              }),
            ],
          );
        },
        '/home': (context) {
          return ProfileScreen(
            providerConfigs: providerConfigs,
            actions: [
              SignedOutAction((context) {
                _navigator.pushNamedAndRemoveUntil(
                  AppRoute.home,
                  (Route<dynamic> route) => false,
                );
              }),
            ],
          );
        },
      },
    );
  }
}

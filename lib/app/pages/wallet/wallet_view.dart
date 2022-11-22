import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/utils/utils.dart';
import 'package:personal_financial_management/domain/blocs/home_bloc/home_bloc.dart';

class WalletView extends StatefulWidget {
  WalletView({Key? key}) : super(key: key);

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  NavigatorState get _navigator => GlobalKeys.appNavigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: MyAppColors.white000, body: Text("Lich su"));
      },
    );
  }
}

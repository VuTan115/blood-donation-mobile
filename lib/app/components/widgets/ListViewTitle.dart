import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/domain/blocs/page_route/page_route_bloc.dart';

class BuildListViewTitle extends StatelessWidget {
  BuildListViewTitle({
    Key? key,
    this.leftTitle = ' ',
    this.rightTitle = '',
    this.onTap,
  }) : super(key: key);
  String leftTitle;
  String rightTitle;
  Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MyAppColors.gray300,
              width: 1,
            ),
          ),
          color: MyAppColors.white000,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leftTitle,
                style: const TextStyle(
                    fontSize: 18,
                    color: MyAppColors.gray800,
                    fontWeight: FontWeight.bold)),
            BlocProvider(
              create: (context) => PageRouteBloc(),
              child: BlocBuilder<PageRouteBloc, PageRouteState>(
                builder: (context, state) {
                  return TextButton(
                      onPressed: () => onTap,
                      child: Text(rightTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 218, 24, 24),
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

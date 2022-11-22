import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/utils/utils.dart';

class ChartIndicator extends StatefulWidget {
  const ChartIndicator({Key? key}) : super(key: key);

  @override
  _ChartIndicatorState createState() => _ChartIndicatorState();
}

class _ChartIndicatorState extends State<ChartIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      addAutomaticKeepAlive: true,
      reverse: true,
      radius: 150.0,
      animation: true,
      animationDuration: 1000,
      lineWidth: 15.0,
      percent: 0.7,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Tổng tiền',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: MyAppColors.gray600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '${numberFormat.format(123459123)} ${numberFormat.currencyName}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: MyAppColors.gray800,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            child: Text(
              'Hạn mức: ${numberFormat.format(200000000)} ${numberFormat.currencyName}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: MyAppColors.gray600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: MyAppColors.gray100,
      progressColor: MyAppColors.gray800,
    );
  }
}

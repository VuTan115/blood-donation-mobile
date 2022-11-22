import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';

class WaitingIndicator extends StatelessWidget {
  final Color color;
  final double size;

  WaitingIndicator({this.color = Colors.blue, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
//    return const CircularProgressIndicator();
//    return const SpinKitRipple(color: Colors.blue);
//    return const SpinKitFadingCube(color: Colors.blue);
//    return const SpinKitRotatingCircle(color: Colors.blue);
//    return const SpinKitRotatingPlain(color: Colors.blue);
//    return const SpinKitChasingDots(color: Colors.blue);
//    return const SpinKitPumpingHeart(color: Colors.blue);
//    return const SpinKitPulse(color: Colors.blue);
//    return const SpinKitDoubleBounce(color: Colors.blue);
//    return const SpinKitWave(color: Colors.blue, type: SpinKitWaveType.start);
//    return const SpinKitWave(color: Colors.blue, type: SpinKitWaveType.center);
//    return const SpinKitWave(color: Colors.blue, type: SpinKitWaveType.end);
    return SpinKitThreeBounce(color: color, size: size);
//    return const SpinKitWanderingCubes(color: Colors.blue);
//    return const SpinKitWanderingCubes(color: Colors.blue, shape: BoxShape.circle);
//    return const SpinKitCircle(color: Colors.blue);
//    return const SpinKitFadingFour(color: Colors.blue);
//    return const SpinKitFadingFour(color: Colors.blue, shape: BoxShape.rectangle);
//    return const SpinKitCubeGrid(color: Colors.blue);
//    return const SpinKitFoldingCube(color: Colors.blue);
//    return const SpinKitRing(color: Colors.blue);
//    return const SpinKitDualRing(color: Colors.blue);
//    return const SpinKitFadingGrid(color: Colors.blue);
//    return const SpinKitFadingGrid(color: Colors.blue, shape: BoxShape.rectangle);
//    return const SpinKitSquareCircle(color: Colors.blue);
//    return const SpinKitSpinningCircle(color: Colors.blue);
//    return const SpinKitSpinningCircle(color: Colors.blue, shape: BoxShape.rectangle);
//    return const SpinKitFadingCircle(color: Colors.blue);
//    return const SpinKitHourGlass(color: Colors.blue);
//    return const SpinKitPouringHourglass(color: Colors.blue);
  }
}

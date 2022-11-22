import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_financial_management/app/utils/assets.dart';

class MyAppImages {
  static Widget backgroundImage = SvgPicture.asset(
    BackgroundImages.backgroundImagesURL,
    width: double.infinity,
  );
  static Widget foregroundImage = SvgPicture.asset(
    BackgroundImages.foregroundImagesURL,
    width: double.infinity,
  );
  static Widget walletProfile = Image.asset(
    ProfileImage.walletProfile,
    width: double.infinity,
  );
}

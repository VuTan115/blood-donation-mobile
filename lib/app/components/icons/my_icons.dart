import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/utils/assets.dart';

class MyAppIcons {
  // default width of icons
  static const double defaultWidth = 24;

  // default height of icons
  static const double defaultHeight = 24;

  // default color of icons
  static const Color defaultColor = Color.fromARGB(255, 218, 24, 24);

  //default box fit of icons
  static const BoxFit defaultFit = BoxFit.fill;

  static Widget defaultStyledIcon(String assetName,
          {double width = defaultWidth,
          double height = defaultHeight,
          BoxFit fit = defaultFit,
          Color color = defaultColor}) =>
      SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit,
      );

  //Logo
  static Widget logo = defaultStyledIcon(Logo.logoURL, width: 100, height: 100);

  //google icon
  static Widget googleIcon =
      defaultStyledIcon(GoogleIcon.googleIconURL, width: 20, height: 20);

  // background
  static Widget background =
      defaultStyledIcon(BackgroundImages.backgroundImagesURL);
  static Widget foreground =
      defaultStyledIcon(BackgroundImages.foregroundImagesURL);

  // content icons
  static Widget add = defaultStyledIcon(ContentIcon.add);
  static Widget copy = defaultStyledIcon(ContentIcon.copy);
  static Widget create = defaultStyledIcon(ContentIcon.create);
  static Widget createActive = defaultStyledIcon(ContentIcon.create);
  static Widget filterList = defaultStyledIcon(ContentIcon.filterList);
  static Widget link = defaultStyledIcon(ContentIcon.link);

  // financial icons
  static Widget atm = defaultStyledIcon(FinancialIcon.atm);
  static Widget bank = defaultStyledIcon(FinancialIcon.bankBuilding);
  static Widget banknote = defaultStyledIcon(FinancialIcon.banknote);
  static Widget bitcoin = defaultStyledIcon(FinancialIcon.bitcoin);
  static Widget creditCard = defaultStyledIcon(FinancialIcon.creditCard);
  static Widget development = defaultStyledIcon(FinancialIcon.development);
  static Widget discountPercent =
      defaultStyledIcon(FinancialIcon.discountPercent);
  static Widget discussion = defaultStyledIcon(FinancialIcon.discussion);
  static Widget dollar = defaultStyledIcon(FinancialIcon.dollar);
  static Widget details = defaultStyledIcon(FinancialIcon.receipt);
  static Widget detailsActive = defaultStyledIcon(FinancialIcon.receipt);
  static Widget euro = defaultStyledIcon(FinancialIcon.euro);
  static Widget exchange = defaultStyledIcon(FinancialIcon.exchange);
  static Widget graph = defaultStyledIcon(FinancialIcon.graph);
  static Widget penny = defaultStyledIcon(FinancialIcon.penny);
  static Widget pieChart = defaultStyledIcon(FinancialIcon.pieChart);
  static Widget pieChartActive = defaultStyledIcon(FinancialIcon.pieChart);
  static Widget piggyBank = defaultStyledIcon(FinancialIcon.piggyBank);
  static Widget pound = defaultStyledIcon(FinancialIcon.pound);
  static Widget priceTag = defaultStyledIcon(FinancialIcon.priceTag);
  static Widget savingsBag = defaultStyledIcon(FinancialIcon.savingsBag);
  static Widget bag = defaultStyledIcon(FinancialIcon.shopperBag);
  static Widget transaction = defaultStyledIcon(FinancialIcon.transaction);
  static Widget wallet = defaultStyledIcon(FinancialIcon.wallet);
  static Widget walletActive = defaultStyledIcon(FinancialIcon.wallet);
  static Widget yen = defaultStyledIcon(FinancialIcon.yen);
  static Widget vnd = defaultStyledIcon(FinancialIcon.vnd,
      height: 10, width: 10, fit: BoxFit.contain);

  // general icons
  static Widget cart = defaultStyledIcon(GeneralIcon.cart);
  static Widget cartActive = defaultStyledIcon(GeneralIcon.cart);
  static Widget chat = defaultStyledIcon(GeneralIcon.chat);
  static Widget group = defaultStyledIcon(GeneralIcon.group);
  static Widget home = defaultStyledIcon(GeneralIcon.home);
  static Widget homeActive = defaultStyledIcon(GeneralIcon.home);
  static Widget mail = defaultStyledIcon(GeneralIcon.mail);
  static Widget person = defaultStyledIcon(GeneralIcon.person);
  static Widget trash = defaultStyledIcon(GeneralIcon.trash);

  // action icons
  static Widget addCircle = defaultStyledIcon(ActionIcon.addCircle);
  static Widget bookmark = defaultStyledIcon(ActionIcon.bookmark);
  static Widget bookmarkOutline = defaultStyledIcon(ActionIcon.bookmarkOutline);
  static Widget build = defaultStyledIcon(ActionIcon.build);
  static Widget cached = defaultStyledIcon(ActionIcon.cached);
  static Widget dictationMic = defaultStyledIcon(ActionIcon.dictationMic);
  static Widget done = defaultStyledIcon(ActionIcon.done);
  static Widget doneCircle = defaultStyledIcon(ActionIcon.doneCircle);
  static Widget doneCircleOutline =
      defaultStyledIcon(ActionIcon.doneCircleOutline);
  static Widget doneCircleInactive =
      defaultStyledIcon(ActionIcon.doneCircleInactive);
  static Widget dragHandle = defaultStyledIcon(ActionIcon.dragHandle);
  static Widget faceID = defaultStyledIcon(ActionIcon.faceID);
  static Widget favorites = defaultStyledIcon(ActionIcon.favorites);
  static Widget favoritesOutline =
      defaultStyledIcon(ActionIcon.favoritesOutline);
  static Widget info = defaultStyledIcon(ActionIcon.info);
  static Widget infoOutline = defaultStyledIcon(ActionIcon.infoOutline);
  static Widget more = defaultStyledIcon(ActionIcon.more);
  static Widget moreOutline = defaultStyledIcon(ActionIcon.moreOutline);
  static Widget plusOutline = defaultStyledIcon(ActionIcon.plusOutline);
  static Widget remove = defaultStyledIcon(ActionIcon.remove);
  static Widget search = defaultStyledIcon(ActionIcon.search);
  static Widget send = defaultStyledIcon(ActionIcon.send);
  static Widget sendOutline = defaultStyledIcon(ActionIcon.sendOutline);
  static Widget setting = defaultStyledIcon(ActionIcon.setting);
  static Widget visibility = defaultStyledIcon(ActionIcon.visibility);
  static Widget visibilityOff = defaultStyledIcon(ActionIcon.visibilityOff);

  // notification icons
  static Widget notification = defaultStyledIcon(SocialIcon.notifications);
  static Widget notificationOutline =
      defaultStyledIcon(SocialIcon.notificationsOutline);
  static Widget notificationImportant =
      defaultStyledIcon(AlertIcon.notificationImportant);

  // share icons
  static Widget shareAndroid = defaultStyledIcon(SocialIcon.shareAndroid);
  static Widget shareIOS = defaultStyledIcon(SocialIcon.shareIOS);

  // social icons
  static Widget smartPhone = defaultStyledIcon(SocialIcon.smartPhone);

  //navigation icons
  static Widget apps = defaultStyledIcon(NavigationIcon.apps);
  static Widget arrowDropDown = defaultStyledIcon(NavigationIcon.arrowDropDown);
  static Widget arrowDropDownCircle =
      defaultStyledIcon(NavigationIcon.arrowDropDownCircle);
  static Widget arrowDropUp = defaultStyledIcon(NavigationIcon.arrowDropUp);
  static Widget arrowLeft = defaultStyledIcon(NavigationIcon.arrowLeft);
  static Widget arrowRight = defaultStyledIcon(NavigationIcon.arrowRight);
  static Widget close = defaultStyledIcon(NavigationIcon.close);
  static Widget closeCircle = defaultStyledIcon(NavigationIcon.closeCircle);
  static Widget fullscreen = defaultStyledIcon(NavigationIcon.fullscreen);
  static Widget fullscreenExit =
      defaultStyledIcon(NavigationIcon.fullscreenExit);
  static Widget menu = defaultStyledIcon(NavigationIcon.menu);
  static Widget backEnabled = defaultStyledIcon(NavigationIcon.chevronLeftOn);
  static Widget moreHorizontal =
      defaultStyledIcon(NavigationIcon.moreHorizontal);
  static Widget moreVertical = defaultStyledIcon(NavigationIcon.moreVertical);

  // two arrow icons on and off
  static Widget chevronLeftOn = defaultStyledIcon(NavigationIcon.chevronLeftOn);
  static Widget chevronRightOn =
      defaultStyledIcon(NavigationIcon.chevronRightOn);
  static Widget chevronLeftOff =
      defaultStyledIcon(NavigationIcon.chevronLeftOff);
  static Widget chevronRightOff =
      defaultStyledIcon(NavigationIcon.chevronRightOff);
  static Widget expandLessOn = defaultStyledIcon(NavigationIcon.expandLessOn);
  static Widget expandLessOff = defaultStyledIcon(NavigationIcon.expandLessOff);
  static Widget expandMoreOn = defaultStyledIcon(NavigationIcon.expandMoreOn);
  static Widget expandMoreOff = defaultStyledIcon(NavigationIcon.expandMoreOff);

  // error icons
  static Widget error = defaultStyledIcon(AlertIcon.error);
  static Widget errorOutline = defaultStyledIcon(AlertIcon.errorOutline);

  // map icons
  static Widget mapDefault = defaultStyledIcon(MapIcon.mapDefault);
  static Widget mapPlace = defaultStyledIcon(MapIcon.mapPlace);

  // toggle icons
  static Widget checkbox = defaultStyledIcon(ToggleIcon.checkbox);
  static Widget checkboxOff = defaultStyledIcon(ToggleIcon.checkboxOff);
  static Widget indeterminateCheckbox =
      defaultStyledIcon(ToggleIcon.indeterminateCheckbox);
  static Widget radioButtonOn = defaultStyledIcon(ToggleIcon.radioButtonOn);
  static Widget radioButtonOff = defaultStyledIcon(ToggleIcon.radioButtonOff);
  static Widget star = defaultStyledIcon(ToggleIcon.star);
  static Widget starOutline = defaultStyledIcon(ToggleIcon.starOutline);
  static Widget starHalf = defaultStyledIcon(ToggleIcon.starHalf);

  //categories icons
  static final Widget book = defaultStyledIcon(CategoriesIcon.book);
  static final Widget clothes = defaultStyledIcon(CategoriesIcon.clothes);
  static final Widget gift = defaultStyledIcon(CategoriesIcon.gift);
  static final Widget key = defaultStyledIcon(CategoriesIcon.key);
  static final Widget lunch = defaultStyledIcon(CategoriesIcon.lunch,
      height: 24, width: 24, fit: BoxFit.contain);
  static final Widget music = defaultStyledIcon(CategoriesIcon.music);
  static final Widget toothBrush = defaultStyledIcon(CategoriesIcon.toothBrush);
}

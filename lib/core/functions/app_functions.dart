import 'dart:io';

import 'package:junior_tennis_organizer/core/constants/constants.dart';
import 'package:junior_tennis_organizer/core/constants/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:launch_review/launch_review.dart';

import '../../data/model/version/update_version_response.dart';
import '../../di/get_it.dart';
import '../../domain/data_source/remote_data_source.dart';
import '../../routes/navigation_route.dart';

class AppFunctions {
  AppFunctions._();

  static double paddingTop(BuildContext context) => MediaQuery.of(context).padding.top;

  static double paddingBottom(BuildContext context) => MediaQuery.of(context).padding.bottom;

  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static launchStore() {
    LaunchReview.launch(androidAppId: Constants.androidPackageName, iOSAppId: Constants.iosAppId, writeReview: false, isiOSBeta: true);
  }

  static double bottomNavigationHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom + 66;
  }

  static Future<UpdateVersion?> checkVersion() async {
    final result = await getItInstance<RemoteDataSource>().checkVersion(
      appName: Platform.isAndroid ? Constants.androidApp : Constants.iosApp,
    );
    if (result.data is UpdateVersionResponse) {
      return result.data?.data;
    } else {
      getItInstance<NavigationRoute>().showError(LocaleKeys.somethingWrong.tr());
      return null;
    }
  }
}

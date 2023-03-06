import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:junior_tennis_organizer/ui/app.dart';
// ignore: depend_on_referenced_packages
import "package:path_provider/path_provider.dart";
import 'core/constants/constants.dart';
import 'core/constants/easy_locale.dart';
import 'di/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(Constants.credentialsBox);
 // await NotificationsService.initialize();
  get_it.init();
  runApp(
    EasyLocalization(
      fallbackLocale: EasyLocale.all.first,
      supportedLocales: EasyLocale.all,
      path: Constants.localePath,
      startLocale: EasyLocale.all.first,
      child: const App(),
    ),
  );
}
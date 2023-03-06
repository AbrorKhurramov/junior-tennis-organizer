import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:junior_tennis_organizer/core/constants/constants.dart';
import 'package:junior_tennis_organizer/cubit/home/home_cubit.dart';
import 'package:junior_tennis_organizer/cubit/main/main_cubit.dart';
import 'package:junior_tennis_organizer/cubit/rankings/rankings_cubit.dart';
import 'package:junior_tennis_organizer/cubit/settings/settings_cubit.dart';
import 'package:junior_tennis_organizer/routes/navigation_route.dart';

import '../core/constants/locale_keys.g.dart';
import '../core/functions/app_functions.dart';
import '../core/theme/theme.dart';
import '../cubit/tournaments/tournaments_cubit.dart';
import '../di/get_it.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final box = Hive.box(Constants.credentialsBox);
  late NavigationRoute _navigationRoute;
  late bool hasUser;
  late String locale;
  late MainCubit _mainCubit;
  late HomeCubit _homeCubit;
  late TournamentsCubit _contactCubit;
  late RankingsCubit _profileCubit;
  late SettingsCubit _settingsCubit;

  @override
  void initState() {
    hasUser = box.get(Constants.hasUser) ?? false;
    locale = box.get(Constants.locale) ?? Constants.uz;
    _mainCubit = getItInstance<MainCubit>();
    _settingsCubit = getItInstance<SettingsCubit>();
    _homeCubit = getItInstance<HomeCubit>();
    _contactCubit = getItInstance<TournamentsCubit>();
    _profileCubit = getItInstance<RankingsCubit>();
    _navigationRoute = getItInstance<NavigationRoute>();
    checkNotificationPermission();
    // checkLatestVersion(box);
    //checkBackgroundNotification();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, // optional
    ));
    super.initState();
  }

  Future<void> checkNotificationPermission() async {
    NotificationPermissions.requestNotificationPermissions(
            iosSettings: const NotificationSettingsIos(sound: true, badge: true, alert: true))
        .then(
      (_) async {
        final result = await NotificationPermissions.getNotificationPermissionStatus();
        if (result != PermissionStatus.granted) {
          _navigationRoute.showError(
            LocaleKeys.accessNotification,
          );
        }
      },
    );
  }

  void checkLatestVersion(Box box) async {
    try {
      final updateVersion = await AppFunctions.checkVersion();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      Version currentVersion = Version.parse(packageInfo.version);
      Version appVersion = Version.parse(updateVersion?.version ?? Constants.defaultVersion);
      if (appVersion > currentVersion) {
        if (updateVersion?.isRequired == true) {
        //  showCompulsoryUpdateDialog(_navigationRoute.navigatorKey.currentContext!);
        } else if (box.get(updateVersion?.version) != true) {
        //  final result = await showOptionalUpdateDialog(_navigationRoute.navigatorKey.currentContext!);
        //  if (result == true) {
         //   box.put(updateVersion?.version, result);
         // }
        }
      } else {}
    } on Exception catch (exception) {
      debugPrint(exception.toString());
    }
  }
  //
  // void checkBackgroundNotification() async {
  //   RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  //   if (remoteMessage != null) {
  //     if (remoteMessage.data[Constants.page] == Constants.news) {}
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>.value(value: _mainCubit),
        BlocProvider<SettingsCubit>.value(value: _settingsCubit),
        BlocProvider<HomeCubit>.value(value: _homeCubit),
        BlocProvider<TournamentsCubit>.value(value: _contactCubit),
        BlocProvider<RankingsCubit>.value(value: _profileCubit),
      ],
      child: BlocBuilder<SettingsCubit, ThemeData>(
  builder: (context, state) {
    return MaterialApp(
        navigatorKey: _navigationRoute.navigatorKey,
        theme: state,
        //darkTheme: appThemeData,
        //themeMode: ThemeMode.system,
        color: AppColor.backgroundLight,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (ctx, child) {
          return MediaQuery(
            data: MediaQuery.of(ctx).copyWith(
              textScaleFactor: Constants.textScaleFactor,
            ),
            child: child!,
          );
        },
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: hasUser ? Routes.main : Routes.intro,
        onGenerateRoute: (RouteSettings settings) {
          final routes = AppPages.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return CupertinoPageRoute(
            builder: builder!,
            settings: settings,
          );
        },
      );
  },
),
    );
  }
}

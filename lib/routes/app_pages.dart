import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/data/model/tournaments/tournament_data.dart';
import 'package:junior_tennis_organizer/ui/intro/intro_screen.dart';
import '../ui/main/home/subpages/settings/settings_screen.dart';
import '../ui/main/main_page.dart';
import '../ui/main/tournaments/subpages/tournament_detail/tournament_detail_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        Routes.intro: (_) => const IntroScreen(),
        Routes.main: (_) => const MainPage(),
        Routes.settings: (_) => const SettingsScreen(),
        Routes.tournamentDetail: (_) =>  TournamentDetailScreen(arguments: setting.arguments as TournamentData),
      };
}

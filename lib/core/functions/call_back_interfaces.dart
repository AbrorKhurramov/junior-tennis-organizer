import 'package:junior_tennis_organizer/core/constants/countries_code.dart';
import 'package:flutter/material.dart';

typedef ShowBaseDialog<T> = Future<T> Function(BuildContext context);

typedef ShowSubscribeDialog<T> = Future<T> Function(BuildContext context);

typedef ShowNamazDialog = Function(BuildContext context, String? type, String? time);

typedef ShowDialog<T> = Future<T> Function(BuildContext context, String text);

typedef ShowCountriesCodeSheet<T> = Future<T> Function(BuildContext context, List<Country> countries, Country currentCountry);

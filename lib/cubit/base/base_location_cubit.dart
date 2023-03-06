import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/functions/call_back_interfaces.dart';

//It's abstract class so not need write unit test
abstract class BaseLocationCubit<T> extends Cubit<T> with WidgetsBindingObserver {
  bool _kIsPaused = false;
  late BuildContext context;
  late ShowBaseDialog showLocationDialog;

  BaseLocationCubit(T initialState) : super(initialState) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> close() async {
    WidgetsBinding.instance.removeObserver(this);
    super.close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (_kIsPaused) {
          _kIsPaused = false;
          determinePosition(context: context);
        }
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  determinePosition({required BuildContext context, bool click = false, int index = 0}) async {
    this.context = context;
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      // ignore: use_build_context_synchronously
      if ((permission == LocationPermission.denied || permission == LocationPermission.deniedForever)&& await showLocationDialog(context) == true) {
        _kIsPaused = true;
        await Geolocator.openAppSettings();
      }
      return;
    }

    // ignore: use_build_context_synchronously
    if (permission == LocationPermission.deniedForever && await showLocationDialog(context) == true) {
      _kIsPaused = true;
      await Geolocator.openAppSettings();
      return;
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // ignore: use_build_context_synchronously
    if (!serviceEnabled && await showLocationDialog(context) == true) {
      _kIsPaused = true;
      await Geolocator.openLocationSettings();
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    changePoint(latitude: position.latitude, longitude: position.longitude);
  }

  changePoint({required double latitude, required double longitude});
}

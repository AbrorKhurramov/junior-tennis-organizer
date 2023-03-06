import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:junior_tennis_organizer/cubit/intro/intro_cubit.dart';
import 'package:junior_tennis_organizer/di/get_it.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final IntroCubit _introCubit;
  late Timer timer;
  @override
  void initState() {
    _introCubit = getItInstance<IntroCubit>();
    super.initState();
    timer = Timer(const Duration(seconds: 3),
            () => _introCubit.next());

  }

  @override
  void dispose() {
    _introCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntroCubit>.value(value: _introCubit),
      ],
      child: BlocBuilder<IntroCubit, dynamic>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: kToolbarHeight),
                /// Logo
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.dimen_42),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.dimen_42), boxShadow: [
                        BoxShadow(
                            color: AppColor.black.withOpacity(0.25), blurRadius: Sizes.dimen_1, spreadRadius: Sizes.dimen_0)
                      ]),
                      child: Image.asset(
                        AppPng.logo,
                        height: Sizes.dimen_120,
                        width: Sizes.dimen_120,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.dimen_16),
                const SizedBox(
                  width: Sizes.dimen_252,
                  child: Text(
                    'Junior Tennis Organizer',
                    style: AppTextStyle.splashText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: Image.asset(AppPng.splashImage)),
              ],
            ),

          );
        },
      ),
    );
  }
}

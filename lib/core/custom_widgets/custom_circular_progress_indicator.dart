import 'dart:math' as math;

import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final bool isPage;

  const CustomCircularProgressIndicator({
    Key? key,
    this.isPage = false,
  }) : super(key: key);

  @override
  State<CustomCircularProgressIndicator> createState() => _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState extends State<CustomCircularProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDuration.duration_8,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.isPage
          ? AnimatedBuilder(
              animation: _controller!.view,
              builder: (context, snapshot) {
                return Transform.rotate(
                  angle: _controller!.value * 2 * math.pi,
                  child: Container(
                    height: Sizes.dimen_48,
                    width: Sizes.dimen_48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.grey,
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              circleWidget(),
                              const SizedBox(
                                width: Sizes.dimen_4,
                              ),
                              circleWidget(),
                            ],
                          ),
                          const SizedBox(
                            height: Sizes.dimen_4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              circleWidget(),
                              const SizedBox(
                                width: Sizes.dimen_4,
                              ),
                              circleWidget(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
          : const CircularProgressIndicator(),
    );
  }

  Widget circleWidget() {
    return Container(
      width: Sizes.dimen_12,
      height: Sizes.dimen_12,
      decoration: const BoxDecoration(
        color: AppColor.primary,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

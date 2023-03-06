import 'package:junior_tennis_organizer/core/custom_widgets/custom_circular_progress_indicator.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ModalProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const ModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.opacity = Sizes.dimen_0,
    this.color = AppColor.transparent,
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = const Center(
        child: CustomCircularProgressIndicator(
          isPage: true,
        ),
      );
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: const CustomCircularProgressIndicator(isPage: true),
      );
    }

    return Stack(
      children: [
        child,
        Opacity(
          opacity: opacity,
          child: ModalBarrier(
            dismissible: dismissible,
            color: color,
          ),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}

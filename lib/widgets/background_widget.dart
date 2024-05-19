import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Color mainColor;
  final Color secondaryColor;
  const BackgroundWidget(
      {super.key, required this.mainColor, required this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(2, -0.3),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-2, -0.3),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1),
          child: Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              color: secondaryColor,
            ),
          ),
        ),
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              color: Colors.transparent,
            ))
      ],
    );
  }
}

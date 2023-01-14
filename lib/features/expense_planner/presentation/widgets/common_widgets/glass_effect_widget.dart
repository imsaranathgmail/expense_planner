// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_in_if_null_operators
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEffectWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  const GlassEffectWidget({
    Key? key,
    required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: double.infinity,
            height: height ?? null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: Colors.white30,
              ),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white60,
                  Colors.white38,
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

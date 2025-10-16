import 'dart:io';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.file(File('assets/black_rose.png')),
        SizedBox(width: 5),
        Text(
          text ??
              (AdaptiveTheme.of(context).brightness == Brightness.light
                  ? 'White Rose'
                  : 'Black Rose'),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 50,
            fontFamily: 'Alegreya Sans SC',
            color: const Color(0xffd600dc),
          ),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  double getMenuWidth(double screenWidth) {
    if (screenWidth > 800) {
      return 400;
    }
    if (screenWidth > 200) {
      return screenWidth * 0.5;
    }
    return screenWidth - 100;
  }

  double getMarginWidth(double screenWidth) =>
      (screenWidth - getMenuWidth(screenWidth)) / 2;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SizedBox(width: getMarginWidth(constraints.maxWidth)),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      centerTitle: true,
                      title: LogoTitle(),
                      foregroundColor: const Color(0xffd600dc),
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    SliverList.list(children: []),
                  ],
                ),
              ),
              SizedBox(width: getMarginWidth(constraints.maxWidth)),
            ],
          ),
        );
      },
    );
  }
}

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.file(File('assets/black_rose.png')),
        SizedBox(width: 5),
        Text(
          'Settings',
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

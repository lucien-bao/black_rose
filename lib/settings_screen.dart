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
                      expandedHeight: 100,
                      leading: Image.file(File('assets/black_rose.png')),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                          fontFamily: 'Alegreya Sans SC',
                          color: const Color(0xffd600dc),
                        ),
                      ),
                    ),
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

import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
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
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
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
                      SliverList.list(children: [BrightnessToggle()]),
                    ],
                  ),
                ),
                SizedBox(width: getMarginWidth(constraints.maxWidth)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BrightnessToggle extends StatefulWidget {
  const BrightnessToggle({super.key});

  @override
  State<BrightnessToggle> createState() => _BrightnessToggleState();
}

class _BrightnessToggleState extends State<BrightnessToggle> {
  Brightness chosen = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    chosen = AdaptiveTheme.of(context).brightness ?? chosen;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            'Brightness',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              fontFamily: 'Alegreya Sans',
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: SegmentedButton<Brightness>(
              segments: [
                ButtonSegment<Brightness>(
                  value: Brightness.light,
                  label: Text('Light'),
                  icon: Icon(Icons.light_mode),
                ),
                ButtonSegment<Brightness>(
                  value: Brightness.dark,
                  label: Text('Dark'),
                  icon: Icon(Icons.dark_mode),
                ),
              ],
              selected: <Brightness>{chosen},
              onSelectionChanged: (Set<Brightness> newSelection) {
                setState(() {
                  chosen = newSelection.first;
                  if (chosen == Brightness.light) {
                    AdaptiveTheme.of(context).setLight();
                  } else {
                    AdaptiveTheme.of(context).setDark();
                  }
                });
              },
            ),
          ),
        ],
      ),
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

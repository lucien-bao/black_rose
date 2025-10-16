import 'package:black_rose/ui/core/logo_title.dart';
import 'package:flutter/material.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

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
                        title: LogoTitle(text: 'Players'),
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
          ),
        );
      },
    );
  }
}

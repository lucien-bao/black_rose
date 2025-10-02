import 'dart:io';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LogoTitle(),

                    SizedBox(height: 20),
                    NewGameButton(),

                    SizedBox(height: 20),
                    MenuButton(
                      icon: Icons.person,
                      text: 'Players',
                      callbackFn: () => {},
                    ),

                    SizedBox(height: 20),
                    MenuButton(
                      icon: Icons.settings,
                      text: 'Settings',
                      callbackFn: () => {},
                    ),

                    SizedBox(height: 20),
                    MenuButton(
                      icon: Icons.question_mark,
                      text: 'Help',
                      callbackFn: () => {},
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
          'Black Rose',
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

class NewGameButton extends StatelessWidget {
  const NewGameButton({super.key});

  void newGame() {
    //TODOimplement me
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: newGame,
      icon: const Icon(Icons.sports_esports, size: 35),
      label: Text(
        'New Game',
        style: TextStyle(fontSize: 35, fontFamily: 'Alegreya Sans SC'),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.icon,
    required this.text,
    required this.callbackFn,
  });

  final IconData icon;
  final String text;
  final void Function() callbackFn;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: callbackFn,
      icon: Icon(icon, size: 30),
      label: Text(
        text,
        style: TextStyle(fontSize: 35, fontFamily: 'Alegreya Sans SC'),
      ),
    );
  }
}

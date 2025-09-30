import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
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
            ),

            SizedBox(height: 20),
            NewGameButton(),
            SizedBox(height: 20),
            MenuButton(
              icon: const Icon(Icons.person, size: 35),
              text: 'Players',
              callbackFn: () => {},
            ),
            SizedBox(height: 20),
            MenuButton(
              icon: const Icon(Icons.settings, size: 35),
              text: 'Settings',
              callbackFn: () => {},
            ),
            SizedBox(height: 20),
            MenuButton(
              icon: const Icon(Icons.question_mark, size: 35),
              text: 'Help',
              callbackFn: () => {},
            ),
          ],
        ),
      ),
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
      icon: const Icon(Icons.add, size: 35),
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

  final Icon icon;
  final String text;
  final void Function() callbackFn;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: callbackFn,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(fontSize: 35, fontFamily: 'Alegreya Sans SC'),
      ),
    );
  }
}

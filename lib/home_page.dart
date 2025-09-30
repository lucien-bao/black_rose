import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Black Rose',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 50,
                fontFamily: "Alegreya Sans SC",
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 20),
            NewGameButton(),
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
    var colorScheme = Theme.of(context).colorScheme;

    return FilledButton.icon(
      onPressed: newGame,
      icon: const Icon(Icons.add, size: 35),
      label: Text(
        'New Game',
        style: TextStyle(
          fontSize: 35,
          fontFamily: "Alegreya Sans SC",
          color: colorScheme.onSecondary,
        ),
      ),
    );
  }
}

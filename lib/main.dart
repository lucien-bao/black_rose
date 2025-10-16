import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:black_rose/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(App(savedThemeMode: savedThemeMode));
}

class App extends StatelessWidget {
  const App({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffd600dc),
          brightness: Brightness.light,
        ),
      ),
      dark: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffd600dc),
          brightness: Brightness.dark,
        ),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Black Rose',
        theme: theme,
        darkTheme: darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}

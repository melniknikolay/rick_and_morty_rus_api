import 'package:flutter/material.dart';

import './screens/characters/screen.dart';
import './screens/profile/screen.dart';
import './theme/color_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: ColorTheme.blue_900,
        primaryColor: ColorTheme.blue_900,
      ),
      home: CharactersScreen(),
    );
  }
}

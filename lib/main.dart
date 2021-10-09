import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_rus_api/screens/adjustments/screen.dart';
import 'package:rick_and_morty_rus_api/screens/episode/screen.dart';
import 'package:rick_and_morty_rus_api/screens/episodes_list/screen.dart';
import 'package:rick_and_morty_rus_api/screens/location/screen.dart';
import 'package:rick_and_morty_rus_api/screens/location_list/screen.dart';

import './screens/characters/screen.dart';
import './screens/profile/screen.dart';
import './theme/color_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorTheme.transparent, // transparent status bar
    ),
  );
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
      home: LocationsListScreen(),
    );
  }
}

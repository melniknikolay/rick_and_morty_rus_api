import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_rus_api/screens/adjustments/screen.dart';
import 'package:rick_and_morty_rus_api/screens/episode/screen.dart';
import 'package:rick_and_morty_rus_api/screens/episodes_list/screen.dart';
import 'package:rick_and_morty_rus_api/screens/location/screen.dart';
import 'package:rick_and_morty_rus_api/screens/location_list/screen.dart';

import './screens/characters/screen.dart';
import './screens/profile/screen.dart';
import './theme/color_theme.dart';
import 'global_bloc.dart/global_bloc.dart';
import 'screens/adjustments/bloc/adjustments_bloc.dart';
import 'screens/characters/bloc/characters_bloc.dart';
import 'screens/episodes_list/bloc/episodes_list_bloc.dart';
import 'screens/location_list/bloc/locations_list_bloc.dart';
import 'screens/splash/screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(
          create: (BuildContext context) => GlobalBloc()
            ..add(
              GlobalEvent.initial(),
            ),
        ),
        BlocProvider<CharactersBloc>(
          create: (BuildContext context) => CharactersBloc()
            ..add(
              CharactersEvent.initial(),
            ),
        ),
        BlocProvider<LocationsListBloc>(
          create: (BuildContext context) => LocationsListBloc()
            ..add(
              LocationsListEvent.initial(),
            ),
        ),
        BlocProvider<EpisodesListBloc>(
          create: (BuildContext context) => EpisodesListBloc()
            ..add(
              EpisodesListEvent.initial(),
            ),
        ),
        BlocProvider<AdjustmentsBloc>(
          create: (BuildContext context) => AdjustmentsBloc()
            ..add(
              AdjustmentsEvent.initial(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(),
          fontFamily: 'Roboto',
          //primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorTheme.blue_900,
          //accentColor: ColorTheme.blue_900,
          //backgroundColor: ColorTheme.blue_900,
          //bottomAppBarColor: ColorTheme.blue_900,
          //canvasColor: ColorTheme.blue_900,
          primaryColor: ColorTheme.blue_900,
        ),
        home: BlocListener<GlobalBloc, GlobalState>(
          listener: (context, state) {},
          child: BlocBuilder<GlobalBloc, GlobalState>(
            builder: (context, state) {
              return state.maybeMap(
                loading: (_) => Center(child: CircularProgressIndicator()),
                data: (_data) {
                  if (_data.activeTab == 0) {
                    return CharactersScreen();
                  }

                  if (_data.activeTab == 1) {
                    return LocationsListScreen();
                  }

                  if (_data.activeTab == 2) {
                    return EpisodesListScreen();
                  }

                  if (_data.activeTab == 3) {
                    return AdjustmentsScreen();
                  }

                  return SplashScreen();
                },
                orElse: () => Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
    );
  }
}

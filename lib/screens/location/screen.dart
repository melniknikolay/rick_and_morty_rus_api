import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_rus_api/components/location_app_bar.dart';

import '/resources/variables.dart';

import '/screens/location/widgets/location_characters.dart';
import '/screens/location/widgets/location_description.dart';
import '/screens/location/widgets/location_image.dart';
import 'bloc/location_bloc.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      create: (BuildContext context) =>
          LocationBloc()..add(LocationEvent.initial()),

      /// Обрабатываем состояние
      child: BlocConsumer<LocationBloc, LocationState>(
        /// Возвращает виджеты поверх основного состояния. Используется для отображения
        /// ошибок, навигации и пр.
        listener: (context, state) {},

        /// Обрабатываем состояния
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => CircularProgressIndicator(),
            data: (_data) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: TransparentAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    LocationImage(_data.location.image),
                    LocationDescription(_data.location),
                    LocationCharacters(_data.charactersAtLocation),
                  ],
                ),
              ),
            ),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

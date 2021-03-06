import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_rus_api/components/transparent_app_bar.dart';
import 'package:rick_and_morty_rus_api/screens/episode/bloc/episode_bloc.dart';

import '/resources/variables.dart';
import '/screens/episode/widgets/episode_characters.dart';
import '/screens/episode/widgets/episode_description.dart';
import '/screens/episode/widgets/episode_image.dart';

class EpisodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EpisodeBloc>(
      create: (BuildContext context) =>
          EpisodeBloc()..add(EpisodeEvent.initial()),
      child: BlocConsumer<EpisodeBloc, EpisodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => Center(
              child: CircularProgressIndicator(),
            ),
            data: (_data) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: TransparentAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    EpisodeImage(
                      image: _data.selectedEpisode.imageName,
                      onPressed: () {},
                    ),
                    EpisodeDescription(_data.selectedEpisode),
                    _data.selectedEpisode.characters == null
                        ? SizedBox.shrink()
                        : EpisodeCharacters(_data.selectedEpisode.characters!),
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

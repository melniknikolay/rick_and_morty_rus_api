import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_rus_api/components/app_divider.dart';

import 'package:rick_and_morty_rus_api/data/models/character.dart';
import 'package:rick_and_morty_rus_api/data/models/episode.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

import 'bloc/profile_bloc.dart';

import 'widgets/chapters.dart';
import 'widgets/chapters_header.dart';
import 'widgets/description.dart';
import 'widgets/page_sliver_header.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double avatarSize = MediaQuery.of(context).size.width / 4;

    /// Делаем доступным блок в дереве виджетов
    return BlocProvider<ProfileBloc>(
        create: (BuildContext context) =>
            ProfileBloc()..add(ProfileEvent.initial()),

        /// Обрабатываем состояние
        child: BlocConsumer<ProfileBloc, ProfileState>(
          /// Возвращает виджеты поверх основного состояния. Используется для отображения
          /// ошибок, навигации и пр.
          listener: (context, state) {},

          /// Обрабатывает состояния
          builder: (context, state) {
            return state.maybeMap(
              loading: (_) => Center(child: CircularProgressIndicator()),
              data: (_data) => Scaffold(
                extendBodyBehindAppBar: true,
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: PageSliverHeader(
                        expandedHeight: 218,
                        image: _data.character.imageName ?? "None",
                      ),
                      pinned: true,
                    ),
                    Description(
                        avatarSize: avatarSize, character: _data.character),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36.0),
                        child: AppDivider(),
                      ),
                    ),
                    ChaptersHeader(),
                    Chapters(chaptersList: _data.character.episodes ?? []),
                  ],
                ),
              ),
              orElse: () => SizedBox.shrink(),
            );
          },
        ));
  }
}

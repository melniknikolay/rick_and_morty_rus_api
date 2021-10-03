import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/components/models/character.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

import 'models/chapter.dart';
import 'widgets/chapters.dart';
import 'widgets/chapters_header.dart';
import 'widgets/description.dart';
import 'widgets/page_sliver_header.dart';

class ProfileScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final Character _character = profile1;
  final List<Chapter> _chaptersList = chaptersList;

  @override
  Widget build(BuildContext context) {
    final double avatarSize = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: PageSliverHeader(
              expandedHeight: 218,
              image: _character.avatar,
            ),
            pinned: true,
          ),
          Description(
            avatarSize: avatarSize,
            character: _character,
            key: key,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36.0),
              child: Divider(color: ColorTheme.blue_600, thickness: 2.0),
            ),
          ),
          ChaptersHeader(),
          Chapters(chaptersList: _chaptersList),
        ],
      ),
    );
  }
}

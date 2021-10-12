import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/components/app_chapters_tile.dart';
import 'package:rick_and_morty_rus_api/data/models/episode.dart';
import 'package:rick_and_morty_rus_api/resources/icons.dart';

import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

class Chapters extends StatelessWidget {
  final List<Episode> chaptersList;

  const Chapters({
    required this.chaptersList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: AppChaptersTile(
              imageSize: 74,
              chapter: chaptersList[index],
              suffix: SvgPicture.asset(
                AppIcons.arrowForwardIos,
                height: 8.0,
                color: ColorTheme.white,
              ),
              onTap: () {},
            ),
          );
        },
        childCount: chaptersList.length,
      ),
    );
  }
}

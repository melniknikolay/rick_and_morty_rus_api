import 'package:flutter/material.dart';

import '/resources/variables.dart';
import '/theme/color_theme.dart';
import '/theme/text_theme.dart';

import '/components/search_text_field.dart';

class EpisodesListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  static const _bottomAppBarHeight = 40.0;

  EpisodesListAppBar()
      : preferredSize = Size.fromHeight(kToolbarHeight + _bottomAppBarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SearchTextField(title: 'Найти эпизод'),
      bottom: TabBar(
        indicatorColor: ColorTheme.white,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: ColorTheme.blueGrey_600,
        isScrollable: true,
        labelStyle: AppTextTheme.button.copyWith(
          letterSpacing: 1.5,
          height: 1.71,
        ),
        tabs: [
          for (final season in seasons) Tab(text: season.name.toUpperCase()),
        ],
      ),
    );
  }
}

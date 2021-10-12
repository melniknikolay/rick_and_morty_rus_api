import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/components/search_text_field.dart';
import '/resources/icons.dart';
import '/theme/color_theme.dart';
import '/theme/text_theme.dart';

class LocationsListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int locationsListLength;
  static const _bottomAppBarHeight = 40.0;

  LocationsListAppBar(this.locationsListLength)
      : preferredSize = Size.fromHeight(kToolbarHeight + _bottomAppBarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SearchTextField(
        title: 'Найти локацию',
        suffixIcon: Row(
          //this two lines makes icons and text stay at proper position
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 1.0,
              height: 24.0,
              color: ColorTheme.white.withOpacity(0.1),
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 12.0, 12.0),
              icon: SvgPicture.asset(
                AppIcons.filterSort,
                color: ColorTheme.blueGrey_600,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(_bottomAppBarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'ВСЕГО ЛОКАЦИЙ: $locationsListLength',
                style: AppTextTheme.subtitle2.copyWith(letterSpacing: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

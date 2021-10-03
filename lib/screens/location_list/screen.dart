import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

import '/screens/location_list/widgets/location_tile.dart';
import '/components/app_bottom_navigation_bar.dart';
import '/components/search_text_field.dart';
import '/resources/variables.dart';

import '/theme/text_theme.dart';

class LocationListScree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorTheme.blue_900,
        automaticallyImplyLeading: false,
        title: SearchTextField(title: 'Найти локацию'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  'ВСЕГО ЛОКАЦИЙ: ${locationsList.length}',
                  style: AppTextTheme.subtitle2.copyWith(letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => LocationTile(locationsList[index]),
        itemCount: locationsList.length,
        itemExtent: 242.0,
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: 16.0,
          right: 18.0,
          bottom: 16.0,
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 1),
    );
  }
}

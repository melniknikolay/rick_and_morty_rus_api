import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/screens/location_list/widgets/location_list_app_bar.dart';
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
      appBar: LocationsListAppBar(locationsList.length),
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

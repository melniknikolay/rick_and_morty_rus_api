import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/components/location_app_bar.dart';

import '/resources/variables.dart';

import '/screens/location/widgets/location_characters.dart';
import '/screens/location/widgets/location_description.dart';
import '/screens/location/widgets/location_image.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LocationImage(location1.image),
            LocationDescription(location1),
            LocationCharacters(charactersOnLocation),
          ],
        ),
      ),
    );
  }
}

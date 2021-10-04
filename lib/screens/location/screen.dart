import 'package:flutter/material.dart';

import '/resources/variables.dart';

import '/screens/location/widgets/location_characters.dart';
import '/screens/location/widgets/location_description.dart';
import '/screens/location/widgets/location_image.dart';
import '/screens/location/widgets/location_app_bar.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: LocationAppBar(),
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

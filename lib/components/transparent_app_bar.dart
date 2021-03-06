import 'package:flutter/material.dart';
import 'package:rick_and_morty_rus_api/resources/icons.dart';

import 'app_circle_button.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  TransparentAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: AppCircleButton(
          icon: AppIcons.arrowBack,
          onPressed: () {},
        ),
      ),
      leadingWidth: 64.0,
      toolbarHeight: 48.0,
    );
  }
}

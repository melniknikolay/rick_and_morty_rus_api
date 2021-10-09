import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_rus_api/components/app_bottom_navigation_bar.dart';
import 'package:rick_and_morty_rus_api/components/app_divider.dart';
import 'package:rick_and_morty_rus_api/resources/variables.dart';
import 'package:rick_and_morty_rus_api/screens/adjustments/widgets/about_app.dart';
import 'package:rick_and_morty_rus_api/screens/adjustments/widgets/theme_alert_dialog.dart';
import 'package:rick_and_morty_rus_api/screens/adjustments/widgets/theme_selector_widget.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';
import 'package:rick_and_morty_rus_api/theme/text_theme.dart';

class AdjustmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var darkModeOptionIndex = 1;

    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: ColorTheme.blue_900,
        title: Text(
          'Настройки',
          style: AppTextTheme.headline6.copyWith(
            letterSpacing: 0.15,
            height: 1.4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36.0),
              Text(
                'ВНЕШНИЙ ВИД',
                style: AppTextTheme.subtitle2.copyWith(
                  height: 1.6,
                  letterSpacing: 1.5,
                ),
              ),
              ThemeSelectorWidget(
                darkModeOptionTitle: themeModeTitles[darkModeOptionIndex],
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) => ThemeAlertDialog(),
                  );
                },
              ),
              const AppDivider(),
              const AboutApp(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 3,
        onTap: () {},
      ),
    );
  }
}

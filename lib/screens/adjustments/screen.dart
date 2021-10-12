import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/components/app_bottom_navigation_bar.dart';
import '/components/app_divider.dart';
import '/resources/variables.dart';

import '/screens/adjustments/widgets/about_app.dart';
import '/screens/adjustments/widgets/theme_alert_dialog.dart';
import '/screens/adjustments/widgets/theme_selector_widget.dart';

import '/theme/color_theme.dart';
import '/theme/text_theme.dart';

import 'bloc/adjustments_bloc.dart';

class AdjustmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdjustmentsBloc>(
      create: (BuildContext context) =>
          AdjustmentsBloc()..add(AdjustmentsEvent.initial()),
      child: BlocConsumer<AdjustmentsBloc, AdjustmentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => CircularProgressIndicator(),
            data: (_data) => Scaffold(
              appBar: AppBar(
                backgroundColor: ColorTheme.blue_900,
                elevation: .0,
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
                        darkModeOptionTitle:
                            _data.themeModeTitles[_data.darkModeOptionIndex],
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) => ThemeAlertDialog(
                              themeOptionIndex: _data.darkModeOptionIndex,
                            ),
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
            ),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

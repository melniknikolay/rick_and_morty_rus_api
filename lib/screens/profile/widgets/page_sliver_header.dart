import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_rus_api/components/app_circle_button.dart';
import 'package:rick_and_morty_rus_api/resources/icons.dart';
import 'package:rick_and_morty_rus_api/theme/color_theme.dart';

class PageSliverHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String image;
  PageSliverHeader({
    required this.expandedHeight,
    required this.image,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double avatarPosition = MediaQuery.of(context).size.width / 4;
    final double avatarSize = MediaQuery.of(context).size.width / 2;

    final appBarSize = maxExtent - shrinkOffset;
    final proportion = 2 - (maxExtent / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorTheme.white,
                    gradient: ColorTheme.appBarGradient,
                    backgroundBlendMode: BlendMode.multiply),
              ),
            ],
          ),
        ),
        Positioned(
          top: expandedHeight / 1.7 - shrinkOffset,
          left: avatarPosition,
          child: Opacity(
            opacity: percent,
            child: Container(
              alignment: Alignment.center,
              width: avatarSize,
              height: avatarSize,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                shape: CircleBorder(
                  side: BorderSide(color: ColorTheme.blue_900, width: 8.0),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: Opacity(
              opacity: percent,
              child: AppCircleButton(
                icon: AppIcons.arrowBack,
                onPressed: () {},
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

import 'package:flutter/material.dart';
import 'package:track_me/configs/app_layout.dart';
import 'package:track_me/styles/app_colors.dart';
import 'package:track_me/configs/images.dart';

class PokeballBackground extends StatelessWidget {
  static const double _focusIconWidthFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  const PokeballBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final focusIconSize =
        MediaQuery.of(context).size.width * _focusIconWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = AppLayout.mainAppBarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;

    final focusIconTopMargin =
        -(focusIconSize / 2 - safeAreaTop - appBarHeight / 2);
    final focusIconRightMargin =
        -(focusIconSize / 2 - iconButtonPadding - iconSize / 2);

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: focusIconTopMargin,
            right: focusIconRightMargin,
            child: Image(
              image: AppImages.focus,
              width: focusIconSize,
              height: focusIconSize,
              color: AppColors.whiteGrey,
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

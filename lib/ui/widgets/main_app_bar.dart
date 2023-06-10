import 'package:flutter/material.dart';
import 'package:track_me/configs/app_layout.dart';
import 'package:track_me/routes.dart';
import 'package:track_me/utils/size_utils.dart';

class MainSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    // color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  MainSliverAppBar({
    super.key,
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + AppLayout.mainAppBarPadding * 2,
    double expandedFontSize = 30,
    void Function()? onLeadingPress = AppNavigator.pop,
    void Function()? onTrailingPress,
    required BuildContext context,
  }) : super(
          centerTitle: true,
          expandedHeight: height,
          floating: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.symmetric(
              horizontal: AppLayout.mainAppBarPadding,
            ),
            onPressed: onLeadingPress,
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(
                horizontal: AppLayout.mainAppBarPadding,
              ),
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              onPressed: onTrailingPress,
            ),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final safeAreaTop = MediaQuery.of(context).padding.top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent =
                  (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              final fontSize = _textStyle.fontSize ?? 16;
              final currentTextStyle = _textStyle.copyWith(
                fontSize: fontSize + (expandedFontSize - fontSize) * percent,
              );

              final textWidth =
                  getTextSize(context, title, currentTextStyle).width;
              const startX = AppLayout.mainAppBarPadding;
              final endX = MediaQuery.of(context).size.width / 2 -
                  textWidth / 2 -
                  startX;
              final dx = startX + endX - endX * percent;

              return Container(
                color: Theme.of(context)
                    .colorScheme
                    .background
                    .withOpacity(0.8 - percent * 0.8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        offset:
                            Offset(dx, constraints.maxHeight - kToolbarHeight),
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

class MainAppBar extends AppBar {
  MainAppBar({super.key, Widget? title, IconData? rightIcon})
      : super(
          title: title,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const IconButton(
            padding:
                EdgeInsets.symmetric(horizontal: AppLayout.mainAppBarPadding),
            icon: Icon(Icons.arrow_back),
            onPressed: AppNavigator.pop,
          ),
          actions: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(right: AppLayout.mainAppBarPadding),
              child: Icon(
                rightIcon,
                color: Colors.white,
              ),
            ),
          ],
        );
}

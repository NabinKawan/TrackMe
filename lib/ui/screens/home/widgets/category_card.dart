import 'package:flutter/material.dart';
import 'package:track_me/configs/images.dart';
import 'package:track_me/domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function()? onPress;

  const CategoryCard(
    this.category, {
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;
        final itemWidth = constrains.maxWidth;

        return Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: _Shadows(color: category.color, width: itemWidth * 0.82),
            ),
            Material(
              color: category.color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onPress,
                highlightColor: Colors.white10,
                splashColor: Colors.white10,
                child: Stack(
                  children: [
                    Positioned(
                      top: -itemHeight * 0.16,
                      right: -itemHeight * 0.25,
                      child: Image(
                        image: AppImages.focus,
                        width: itemHeight * 1.388,
                        height: itemHeight * 1.388,
                        color: Colors.white.withOpacity(0.14),
                      ),
                    ),
                    Positioned(
                      top: -itemHeight * 0.616,
                      left: -itemHeight * 0.53,
                      child: CircleAvatar(
                        radius: (itemHeight * 1.03) / 2,
                        backgroundColor: Colors.white.withOpacity(0.14),
                      ),
                    ),
                    _CardContent(category.name),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _Shadows extends StatelessWidget {
  const _Shadows({required this.color, required this.width});

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.82,
      height: 11,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0, 3),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}

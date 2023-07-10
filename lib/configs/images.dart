import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const focus = _Image('pokeball.png');

  // static Future precacheAssets(BuildContext context) async {
  //   await precacheImage(pokeball, context);
  // }
}

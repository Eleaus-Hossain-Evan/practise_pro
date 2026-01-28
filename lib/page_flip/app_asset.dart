import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  AppAssets._();

  static const profileIcon = 'assets/page_flip/man.svg';
  static const forestDay = 'assets/page_flip/forest-day.svg';
  static const forestNight = 'assets/page_flip/forest-night.svg';

  static Future<void> precacheAll(BuildContext context) async {
    final assets = [profileIcon, forestDay, forestNight];
    for (final asset in assets) {
      await svg.cache.putIfAbsent(
        asset,
        () => SvgAssetLoader(asset).loadBytes(context),
      );
    }
  }
}

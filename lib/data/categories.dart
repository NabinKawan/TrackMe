import 'package:track_me/configs/colors.dart';
import 'package:track_me/domain/entities/category.dart';
import 'package:track_me/routes.dart';

const List<Category> categories = [
  Category(name: 'LeetCode', color: AppColors.teal, route: Routes.home),
  Category(name: 'Weekly Projects', color: AppColors.red, route: Routes.home),
  Category(
    name: 'Monthlty Projects',
    color: AppColors.blue,
    route: Routes.home,
  ),
];

import 'package:flutter/material.dart';
import 'package:track_me/data/categories.dart';
import 'package:track_me/domain/entities/category.dart';
import 'package:track_me/routes.dart';
import 'package:track_me/ui/screens/home/widgets/category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  void _onSelectCategory(Category category) {
    AppNavigator.push(category.route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(28, 42, 28, 62),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2.6,
        mainAxisSpacing: 15,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categories[index],
          onPress: () => _onSelectCategory(categories[index]),
        );
      },
    );
  }
}

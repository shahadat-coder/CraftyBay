import 'package:crafty_bay/data/models/product.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryData, required this.onTap,
  });

  final Category categoryData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 65,
                width: 65,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5)),
                child: Image.network(categoryData.categoryImg ?? '',height: 60),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryData.categoryName ?? '',
              style: const TextStyle(
                  fontSize: 15,
                  color: ColorPalette.primaryColor,
                  letterSpacing: 0.4),
            )
          ],
        ),
      ),
    );
  }
}

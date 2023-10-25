
import 'package:crafty_bay/data/models/product_review_model.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ProductReviewData productReviewData;

  const ReviewCard({
    super.key,
    required this.productReviewData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorPalette.primaryColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: productReviewData.profile?.cusName ?? '',
                icon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productReviewData.description ?? '',
                style: const TextStyle(color: Colors.black54, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
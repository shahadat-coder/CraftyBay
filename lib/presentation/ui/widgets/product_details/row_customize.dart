import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/review_List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingReviewScreen extends StatefulWidget{
  const RatingReviewScreen({super.key});
  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreen();
}
class _RatingReviewScreen extends State<RatingReviewScreen>{
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            Text(
              '4.9',
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(const ProductReviewList());
          },
          child: const Text(
            'Review',
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorPalette.primaryColor,
            ),
          ),
        ),
        const Card(
          color: ColorPalette.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
  }
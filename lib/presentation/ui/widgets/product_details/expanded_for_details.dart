import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/custom_steper.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/increment_and_decrement.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/description.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/row_customize.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/selected_color_index.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/selected_size_index.dart';
import 'package:flutter/material.dart';

class ExpandedArea extends StatefulWidget{
  const ExpandedArea({super.key});
  @override
  State<ExpandedArea> createState() => _ExpandedArea();
}
class _ExpandedArea extends State<ExpandedArea>{



  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IncrementAndDecrement(),
              RatingReviewScreen(),
              Text(
                'Color',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              SelectedColorIndex(),
              SizedBox(
                height: 16,
              ),
              Text(
                'Size',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16,
              ),
              SelectedSizeIndex(),
              SizedBox(
                height: 16,
              ),
              Text("Description",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5)),
              SizedBox(height: 16),
              Description(),
            ],
          ),
        ),
      ),
    );
  }
  }
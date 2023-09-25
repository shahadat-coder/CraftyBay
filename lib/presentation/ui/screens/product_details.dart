import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/add_to_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/custom_steper.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/expanded_for_details.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Stack(
          children: [
            const ProductImageSlider(),
            AppBar(
              leading: const BackButton(
                color: Colors.black54,
              ),
              title: const Text('Product Details',
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
        const ExpandedArea(),
        const AddToCart(),
      ],
      ),
        ),
    );
  }
}

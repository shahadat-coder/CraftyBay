import 'package:crafty_bay/presentation/State_Holder/auth_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/product_review_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/read_profile%20controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../category_coustomize/constraints.dart';

class ProductReviewScreen extends StatefulWidget {
  final int productId;

  const ProductReviewScreen({super.key, required this.productId});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ProductReviewController>()
          .getProductReviews(widget.productId);
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: appBackgroundColor,
        title: Text('Review List', style: appBarStyle),
        leading: IconButton(
          color: iconColor,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            // Get.back();
            Get.find<MainButtonNavController>().backToHome();
          },
        ),
      ),
      body: GetBuilder<ProductReviewController>(
          builder: (productReviewScreenController) {
            if (productReviewScreenController.getProductReviewInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: productReviewScreenController
                          .productReviewModel.data?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        return ReviewCard(
                          productReviewData: productReviewScreenController
                              .productReviewModel.data![index],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: ColorPalette.primaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews (${productReviewScreenController.productReviewModel.data?.length ?? 0})',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () async {
                          await Get.find<ReadProfileController>().readProfileData();
                          if (AuthController.isLoggedIn) {
                            Get.to(() => CreateReviewScreen(
                              productId: widget.productId,
                            ));
                          } else {
                            Get.offAll(() => const EmailVerificationScreen());
                          }
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: ColorPalette.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                            weight: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
import 'package:crafty_bay/presentation/State_Holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/product_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/wish_list_product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<WishListController>().getWishlistProducts();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainButtonNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: appBackgroundColor,
          title: Text('Wish List', style: appBarStyle),
          leading: IconButton(
            color: iconColor,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              // Get.back();
              Get.find<MainButtonNavController>().backToHome();
            },
          ),
        ),
        body: GetBuilder<WishListController>(
            builder: (wishListScreenController) {
              if (wishListScreenController.getWishListProductsInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (wishListScreenController.wishListProductModel.data != null &&
                  wishListScreenController.wishListProductModel.data!.isEmpty) {
                return const Center(
                  child: Text('WishList is empty!'),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  itemCount:
                  wishListScreenController.wishListProductModel.data?.length ??
                      0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                          productId: wishListScreenController
                              .wishListProductModel.data![index].productId!,
                        ));
                      },
                      child: FittedBox(
                        child: WishListProductCard(
                          productData: wishListScreenController
                              .wishListProductModel.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
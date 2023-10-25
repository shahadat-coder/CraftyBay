import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/presentation/State_Holder/delete_wish_list_product.dart';
import 'package:crafty_bay/presentation/State_Holder/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListProductCard extends StatelessWidget {
  final WishListProductData productData;

  const WishListProductCard({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorPalette.primaryColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 130,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: ColorPalette.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(productData.product?.image ?? ''))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    productData.product?.title ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${productData.product?.price ?? 0}',
                        style: TextStyle(
                            fontSize: 13,
                            color: ColorPalette.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                          Text(
                            '${productData.product?.star ?? 0}',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      Card(
                        color: ColorPalette.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () async {
                              await deleteWishlistProduct(
                                  productData.productId!);
                            },
                            child: const Icon(
                              Icons.delete_forever_outlined,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteWishlistProduct(int productId) async {
    final response = await Get.find<DeleteWishListProductController>()
        .deleteWishlistProduct(productId);
    if (response) {
      Get.snackbar('Success', 'Remove from wishlist successful.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      await Get.find<WishListController>().getWishlistProducts();
    } else {
      Get.snackbar('Failed', 'Remove from wishlist failed!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
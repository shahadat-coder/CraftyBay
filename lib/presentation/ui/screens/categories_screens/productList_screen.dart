import 'package:crafty_bay/data/models/popular_model.dart';
import 'package:crafty_bay/presentation/State_Holder/product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
   final int? categoryId;
   final ProductModel? productModel;
  const ProductListScreen({super.key, this.categoryId, this.productModel});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.categoryId != null) {
        Get.find<ProductListController>().getProductByCategory(
            widget.categoryId!);
      } else if (widget.productModel != null) {
        Get.find<ProductListController>().setProducts(widget.productModel!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: appBackgroundColor,
        title: Text('product List', style: appBarStyle),
        leading: IconButton(
          color: iconColor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();

          },
        ),
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
      if(productListController.getProductsInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(productListController.productModel.data?.isEmpty?? true){
        return const Center(
          child: Text('Empty Screen'),
        );
      }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: GridView.builder(
              itemCount: productListController.productModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 32,
              ),
              itemBuilder: (context, index) {
                return  FittedBox(
                  fit: BoxFit.cover,
                   child: ProductCard(
                    product: productListController.productModel.data![index],
                 ));
              },
            ),
          );
        }
      ),
    );
  }
}

import 'package:crafty_bay/data/models/productDetails.dart';
import 'package:crafty_bay/presentation/State_Holder/ProductDetails_Controller.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/custom_steper.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/add_to_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/selected_size_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<String> colors = [];

  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL'
  ];

  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
            if (productDetailsController.getProductDetailsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ProductImageSlider(
                                imageList: [
                                  productDetailsController.productDetails.img1 ?? '',
                                  productDetailsController.productDetails.img2 ?? '',
                                  productDetailsController.productDetails.img3 ?? '',
                                  productDetailsController.productDetails.img4 ?? '',
                                ],
                              ),
                              productDetailsAppBar,
                            ],
                          ),
                          productDetails(productDetailsController!.productDetails,
                              productDetailsController.availableColors),
                        ],
                      ),
                    ),
                  ),
                  cartToCartBottomContainer,
                ],
              ),
            );
          }
      ),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    productDetails.product?.title ?? '',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5),
                  )),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {
                    print(newValue);
                  })
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 15,
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Card(
                color: ColorPalette.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                print(colors[index]);
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    _selectedColorIndex = index;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                    radius: 18,
                    // backgroundColor: HexColor.fromHex(colors[index]),
                    child: _selectedColorIndex == index
                        ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                        : null,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: SizedBox(
              height: 28,
              child: SelectedSizeIndex(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedSizeIndex = selectedSize;
                },
                sizes: productDetails.size?.split(',') ?? [],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(productDetails.des ?? ''),
        ],
      ),
    );
  }


  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container get cartToCartBottomContainer {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: ColorPalette.primaryColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )
        ),
        child: const AddToCart()
    );
  }
}
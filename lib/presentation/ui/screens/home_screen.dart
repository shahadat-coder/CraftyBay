import 'package:crafty_bay/presentation/State_Holder/category_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/new_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/popular_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screens/electronics_categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screens/productList_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/appbar_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_search_field.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_header.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../State_Holder/main_bottom_nav_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBackgroundColor,
        title: SvgPicture.asset(
          AppImageAssets.craftyBayLogoNavSVG,
          width: 115,
        ),
        actions: [

          AppBarIconButton(
            icon: Icons.light_mode,
            onPressed: () {
                // themeModeController.toggleThemeMode();
                    if (Get.isDarkMode) {
                      Get.changeThemeMode(ThemeMode.light);
                    } else {
                      Get.changeThemeMode(ThemeMode.dark);
                    }
                  },
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIconButton(
            icon: Icons.person_outlined,
            onPressed: () {(
                  Get.to( const CompleteProfileScreen()),
            );
            },
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIconButton(
            icon: Icons.call_outlined,
            onPressed: () {
              Get.to(const EmailVerificationScreen());
            },
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIconButton(
            icon: Icons.notifications_active_outlined,
            onPressed: () {},
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const HomeSearchField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(
                builder: (HomeSliderController) {
                  if(HomeSliderController.getHomeSliderInProgress) {
                    return const SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: CircularProgressIndicator(),
                    );
                  }
                return  HomeCarouselSlider(
                    sliders:HomeSliderController.sliderModel.data ?? [] );
                }
              ),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainButtonNavController>().changedScreen(1);
                },
              ),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoryInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: categoryController.categoryModel.data!.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Get.to(const ElectronicsCategoriesScreen());
                            },
                            child: CategoryCard(categoryData: categoryController.categoryModel.data![index], onTap: () {
                             Get.to(ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!,));
                            },));
                      },
                    );
                  }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to( ProductListScreen(productModel: Get.find<PopularController>().popularProductModel ,));
                },
              ),
              SizedBox(
                height: 155,
                child: GetBuilder<PopularController>(
                  builder: (popularController) {
                    if(popularController.getPopularProductInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: popularController.popularProductModel.data!.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product:  popularController.popularProductModel.data![index],
                        );
                      },
                    );
                  }
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to( ProductListScreen(productModel: Get.find<SpecialProductController>().specialProductModel));
                },
              ),
              SizedBox(
                height: 155,
                child: GetBuilder<SpecialProductController>(
                    builder: (popularController) {
                      if(popularController.getSpecialProductInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView.builder(
                        itemCount: popularController.specialProductModel.data!.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product:  popularController.specialProductModel.data![index],
                          );
                        },
                      );
                    }
                ),
              ),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to( ProductListScreen(productModel: Get.find<NewProductController>().newProductModel,));
                },
              ),
              SizedBox(
                height: 155,
                child:GetBuilder<NewProductController>(
                    builder: (popularController) {
                      if(popularController.getNewProductInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount: popularController.newProductModel.data!.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product:  popularController.newProductModel.data![index],
                          );
                        },
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

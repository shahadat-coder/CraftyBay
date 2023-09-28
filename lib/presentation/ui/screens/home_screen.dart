import 'package:crafty_bay/presentation/State_Holder/home_slider_controller.dart';
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
import 'package:get/route_manager.dart';

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
            icon: Icons.person_outlined,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a Snackbar!'),
                ),
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
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(ElectronicsCategoriesScreen());
                        },
                        child: const CategoryCard());
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(const ProductListScreen());
                },
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      icon: Icons.favorite_border_rounded,
                    );
                  },
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(const ProductListScreen());
                },
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      icon: Icons.favorite_border_rounded,
                    );
                  },
                ),
              ),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(const ProductListScreen());
                },
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      icon: Icons.favorite_border_rounded,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

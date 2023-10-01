import 'package:crafty_bay/presentation/State_Holder/category_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/popular_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


import '../../State_Holder/main_bottom_nav_controller.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishScreen()
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSliders();
      Get.find<CategoryController>().getCategory();
      Get.find<PopularController>().getPopularProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainButtonNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentSelectedIndex,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            selectedItemColor: ColorPalette.primaryColor,
            onTap: controller.changedScreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house,), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded, size: 25,),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.basketShopping), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gift), label: 'Wish'),
            ],
          ),
        );
      }
    );
  }
}

import 'package:crafty_bay/presentation/State_Holder/ProductDetails_Controller.dart';
import 'package:crafty_bay/presentation/State_Holder/cart_list_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/category_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/createProfile_Controller.dart';
import 'package:crafty_bay/presentation/State_Holder/create_wish_list.dart';
import 'package:crafty_bay/presentation/State_Holder/delete_wish_list_product.dart';
import 'package:crafty_bay/presentation/State_Holder/email_verification_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/new_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/pin_verification_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/popular_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/product_list_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/read_profile%20controller.dart';
import 'package:crafty_bay/presentation/State_Holder/special_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/theme_mode_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/wish_list_controller.dart';
import '../presentation/State_Holder/add to cart_controller.dart';
import 'package:get/get.dart';



class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainButtonNavController());
    Get.put(EmailVerificationController());
    Get.put(PinVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ProductListController());
    Get.put(CartListController());
    Get.lazyPut(() => ThemeModeController());
    Get.put(CreateProfileController());
    Get.put(ReadProfileController());
    Get.put(DeleteWishListProductController());
    Get.put(WishListController());
    Get.put(CreateWishListController());
  }

}
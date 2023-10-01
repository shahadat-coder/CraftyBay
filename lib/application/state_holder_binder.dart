import 'package:crafty_bay/presentation/State_Holder/category_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/email_verification_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/new_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/pin_verification_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/popular_product_controller.dart';
import 'package:crafty_bay/presentation/State_Holder/special_product_controller.dart';
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
  }

}
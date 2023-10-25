
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateWishListController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> setProductInWishList(int productId) async {
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.setProductInWishList(productId));
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Set product wishList failed!';
      return false;
    }
  }
}
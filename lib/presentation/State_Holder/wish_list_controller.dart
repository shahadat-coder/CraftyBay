
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListProductsInProgress = false;
  WishListProductModel _wishListProductModel = WishListProductModel();
  String _errorMessage = '';

  bool get getWishListProductsInProgress => _getWishListProductsInProgress;

  WishListProductModel get wishListProductModel => _wishListProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getWishlistProducts() async {
    _getWishListProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.productWishList);
    _getWishListProductsInProgress = false;
    if (response.isSuccess) {
      _wishListProductModel =
          WishListProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'WishList product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
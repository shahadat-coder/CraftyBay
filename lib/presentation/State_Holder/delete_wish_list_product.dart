
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteWishListProductController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> deleteWishlistProduct(int productId) async {
    final NetworkResponse response = await NetworkCaller
        .getRequest(Urls.deleteWishlistProduct(productId),);
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Delete wish list product failed!';
      return false;
    }
  }
}
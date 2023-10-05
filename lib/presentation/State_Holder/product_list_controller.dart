
import 'package:crafty_bay/data/models/categoryModel.dart';
import 'package:crafty_bay/data/models/popular_model.dart';
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _getProductsProgress = false;
  String _message = '';

  bool get getProductsInProgress => _getProductsProgress;
  ProductModel _productModel = ProductModel();
  String get message => _message;

  ProductModel get productModel => _productModel;

  Future<bool> getProductByCategory(int categoryId) async {
    _getProductsProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        Urls.getProductByCategory(categoryId));
    _getProductsProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Product list data fetch failed!';
      update();
      return false;
    }
  }
    void setProducts(ProductModel productModel) {
      _productModel = productModel;
      update();
    }
}
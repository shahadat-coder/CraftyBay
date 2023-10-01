
import 'package:crafty_bay/data/models/popular_model.dart';
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';


class NewProductController extends GetxController{
bool _getNewProductInProgress = false;
ProductModel _newModel = ProductModel();
String _errorMassage = '';
bool get getNewProductInProgress => _getNewProductInProgress;

ProductModel get newProductModel => _newModel;

String get errorMassage => _errorMassage;

Future<bool> getNewProduct() async {
  _getNewProductInProgress = true;
  update();
  final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemarks('new'));
  _getNewProductInProgress = false;
  if (response.isSuccess) {
    _newModel = ProductModel.fromJson(response.responseJson?? {});
    update();
    return true;
  } else {
    _errorMassage = 'New Product fetch failed';
    update();
    return false;
  }
}

}
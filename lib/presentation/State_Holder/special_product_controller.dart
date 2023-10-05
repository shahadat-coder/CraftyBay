import 'package:crafty_bay/data/models/popular_model.dart';
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';



class SpecialProductController extends GetxController{
bool _getSpecialProductInProgress = false;
ProductModel _SpecialModel = ProductModel();
String _errorMassage = '';
bool get getSpecialProductInProgress => _getSpecialProductInProgress;

ProductModel get specialProductModel => _SpecialModel;

String get errorMassage => _errorMassage;

Future<bool> getSpecialProduct() async {
  _getSpecialProductInProgress = true;
  update();
  final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks('special'));
  _getSpecialProductInProgress = false;
  if (response.isSuccess) {
    _SpecialModel = ProductModel.fromJson(response.responseJson?? {});
    update();
    return true;
  } else {
    _errorMassage = 'Special Product fetch failed';
    update();
    return false;
  }
}

}
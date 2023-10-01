import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';
import '../../data/models/popular_model.dart';

class PopularController extends GetxController{
bool _getPopularProductInProgress = false;
ProductModel _popularModel = ProductModel();
String _errorMassage = '';
bool get getPopularProductInProgress => _getPopularProductInProgress;

ProductModel get popularProductModel => _popularModel;

String get errorMassage => _errorMassage;

Future<bool> getPopularProduct() async {
  _getPopularProductInProgress = true;
  update();
  final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemarks('popular'));
  _getPopularProductInProgress = false;
  if (response.isSuccess) {
    _popularModel = ProductModel.fromJson(response.responseJson?? {});
    update();
    return true;
  } else {
    _errorMassage = 'Popular Product fetch failed';
    update();
    return false;
  }
}

}

import 'package:crafty_bay/data/models/categoryModel.dart';
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _getCategoryProgress = false;
  String _message = '';

  bool get getCategoryInProgress => _getCategoryProgress;
  CategoryModel _categoryModel = CategoryModel();
  String get message => _message;

  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategory() async {
    _getCategoryProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getCategory);
    _getCategoryProgress = false;
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.responseJson?? {});
      update();
      return true;
    } else {
      _message = 'Category data fetch failed';
      update();
      return false;
    }
  }
}

import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/models/slider_Model.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _getHomeSliderInProgress = false;
  String _message = '';

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  SliderModel _sliderModel = SliderModel();
  String get message => _message;

  SliderModel get sliderModel => _sliderModel;

  Future<bool> getHomeSliders() async {
    _getHomeSliderInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getHomeSlider);
    _getHomeSliderInProgress = false;
    if (response.isSuccess) {
      _sliderModel = SliderModel.fromJson(response.responseJson?? {});
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
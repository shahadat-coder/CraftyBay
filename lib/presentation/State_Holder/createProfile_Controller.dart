
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  bool _createProfileInProgress = false;
  String _message = '';

  bool get createProfileInProgress => _createProfileInProgress;
  String get message => _message;

  Future<bool> createProfileData(
      String firstName, lastName, mobile, city, shippingAddress) async {
    _createProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createProfile,
      {
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "city": city,
        "shippingAddress": shippingAddress
      },
    );
    _createProfileInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _message = 'Create Profile failed! Try again';
      return false;
    }
  }
}
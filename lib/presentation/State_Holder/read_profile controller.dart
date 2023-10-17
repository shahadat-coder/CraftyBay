import 'dart:developer';
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/models/service/user_profile_model.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';



class ReadProfileController extends GetxController {
  bool _readProfileInProgress = false;
  String _message = '';
  UserProfileModel _readProfileModel = UserProfileModel();

  bool get readProfileInProgress => _readProfileInProgress;
  String get message => _message;
  UserProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    _readProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileInProgress = false;
    if (response.responseJson != null) {
      _readProfileModel = UserProfileModel.fromJson(response.responseJson!);
      update();

      return true;
    } else {
      _message = 'Read Profile failed! Try again';
      return false;
    }
  }
}

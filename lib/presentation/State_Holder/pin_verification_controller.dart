
import 'package:crafty_bay/data/models/service/network_caller.dart';
import 'package:crafty_bay/data/network_response.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/State_Holder/auth_controller.dart';
import 'package:get/get.dart';

class PinVerificationController extends GetxController {
  bool _pinVerificationInProgress = false;
  String _message = '';

  bool get otpVerificationInProgress => _pinVerificationInProgress;

  String get message => _message;

  Future<bool> verifyOtp(String email, String otp) async {
    _pinVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _pinVerificationInProgress = false;
    update();
    if (response.isSuccess) {
     await  AuthController.setAccessToken(response.responseJson?['data']);
      return true;
    } else {
      return false;
    }
  }
}
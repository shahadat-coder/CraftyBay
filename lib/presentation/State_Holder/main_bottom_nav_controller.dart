import 'package:get/get.dart';

class MainButtonNavController extends GetxController{
  int currentSelectedIndex = 0;
  void changedScreen(int index){
    currentSelectedIndex = index;
    update();
  }
  void backToHome(){
    changedScreen(0);
  }
}
import 'package:crafty_bay/presentation/State_Holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'state_holder_binder.dart';

class CraftyBay extends StatelessWidget {

 static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();


  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        primarySwatch: MaterialColor(
            ColorPalette.primaryColor.value, ColorPalette().colors),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            hintStyle: TextStyle(
              color: Colors.grey[350],
            ),
            filled: true,
            fillColor: Colors.grey[50],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: ColorPalette.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: ColorPalette.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            errorStyle: const TextStyle(color: Colors.redAccent)),
      ),
      home: const SplashScreen(),
    );
  }
}

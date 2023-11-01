import 'package:flutter_svg/flutter_svg.dart';

class AppImageAssets {
  static const String craftyBayLogoSVG = 'assets/images/logo.svg';
  static const String craftyBayLogoNavSVG = 'assets/images/logo_nav.svg';
  static const String productShoe = 'assets/images/shoes.png';


  static final authLogo = SvgPicture.asset(
    AppImageAssets.craftyBayLogoSVG,
    width: 100,
  );

  static final navLogo = SvgPicture.asset(
    AppImageAssets.craftyBayLogoNavSVG,
  );
}

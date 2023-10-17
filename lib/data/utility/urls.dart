class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSlider ='$_baseUrl/ListProductSlider';
  static String getCategory ='$_baseUrl/CategoryList';
  static String getProductByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static String getProductByRemarks(String remarks) =>'$_baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static const String getCartList = '$_baseUrl/CartList';
  static String createProfile = "$_baseUrl/CreateProfile";
  static String readProfile = "$_baseUrl/ReadProfile";
}
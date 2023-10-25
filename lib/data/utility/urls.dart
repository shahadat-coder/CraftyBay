class Urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

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
  static String removeFromCart(int id) => '$_baseUrl/DeleteCartList/$id';
  static String productWishList = '$_baseUrl/ProductWishList';
  static String deleteWishlistProduct(int productId) =>
      '$_baseUrl/RemoveWishList/$productId';
  static String setProductInWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';
  static String getReviews(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
  static String createProductReview = '$_baseUrl/CreateProductReview';
}
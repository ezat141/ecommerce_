class AppLink {
  static const String server = "https://ecommerce-4hlw.onrender.com";
//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/register";
  static const String login = "$server/auth/login";
  static const String verifycodessignup = "$server/auth/verify-code";
  static const String resendverifycodesignup =
      "$server/auth/resend-verify-code";

  // ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetPassword/checkEmail";
  static const String verifycodeforgetpassword =
      "$server/forgetPassword/verifyCode";
  static const String resetPassword = "$server/forgetPassword/resetPassword";

  // Home

  static const String homepage = "$server/home";
  // products
  static const String products = "$server/products/category";
  static const String searchitems = "$server/products/search";
  static const String offers = "$server/products/getOffers";

  // Favorite
  static const String favoriteAdd = "$server/favorites/add";
  static const String favoriteRemove = "$server/favorites/remove";
  static const String favoriteView =
      "$server/favorites/getFavoritesWithDetails";
  static const String removeFromFavorites =
      "$server/favorites/removeFromFavorites";
  // Cart
  static const String cartview = "$server/cart/getCart";
  static const String cartadd = "$server/cart/addToCart";
  static const String cartdelete = "$server/cart/removeCartItem";
  static const String cartgetcountitems = "$server/cart/getCountItems";

  // Address

  static const String addressView = "$server/address/view";
  static const String addressAdd = "$server/address/add";
  static const String addressEdit = "$server/address/edit";
  static const String addressDelete = "$server/address/delete";

  // Coupon

  static const String checkcoupon = "$server/coupons/check";
  // Checkout

  static const String checkout = "$server/orders/checkout";

  static const String pendingorders = "$server/orders/getOrders";
  static const String ordersdetails = "$server/orders/ordersDetailsView";
  static const String ordersdelete = "$server/orders/deleteOrder";
  static const String ordersarchive = "$server/orders/archiveOrder";
  static const String rating = "$server/orders/rateOrder";
}

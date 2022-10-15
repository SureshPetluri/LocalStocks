class AppRoutes {
  int? id =0;
  AppRoutes({this.id});
  static const String productAdd = "/ProductAdd";
  static const String home = "/Home";
  static const String register = "/Register";
  static const String login = "/Login";
  static const String category = "/Category";
  static const String selectCategory = "/SelectCategory";
  static const String addAttributes = "/AddAttributes";
  static const String productDetailsPage = "/ProductDetailsPage";
  String get directProductDetailsPage => "/ProductDetailsPage/$id";
  static const String cart = "/cart";
  static const String orderConformation = "/orderConformation";
  static const String updateAndDeleteCategory = "/upadetAndDeleteCategory";
}
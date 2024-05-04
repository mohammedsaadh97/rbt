class AppUrl {
  static const baseHost = "rbtbearings.com";
 // static const baseHost = "rbt.cloudsdial.in";
  static const baseHttp = "https://";
  static const api = "/apis";
  static const baseUrl = "$baseHttp$baseHost$api";
  static const imagebaseUrlcategory = "$baseHttp$baseHost/assets/images/category/";
  static const imagebaseUrlsubcategory = "$baseHttp$baseHost/assets/images/sub_category/";
  static const imagebaseUrlmultisubcategory = "$baseHttp$baseHost/assets/images/multi_sub_category/";
  static const imagebaseUrlmultitwosubcategory = "$baseHttp$baseHost/assets/images/multi_two_sub_category/";
  static const imagebaseUrlcategoryproduct = "$baseHttp$baseHost/assets/images/products/";

  //list of category

  static const categoryList = "/category"; //Get
  static const subcategoryList = "/category_full_list?"; //Get
  static const subcategoryDetailsList = "/sub_category_full_list?"; //Get
  static const multisubcategoryDetailsList = "/multi_sub_category_full_list?"; //Get
  static const categoryProduct = "/category_product?"; //Get
  static const ProductList = "/productss"; //Get
  static const aboutUs = "/about_us"; //Get
  static const contactUs = "/contact_us"; //Get

}

// back up URL
/*class AppUrl {
  static const baseHost = "rbt.cloudsdial.in";
  static const baseHttp = "https://";
  static const api = "/apis";
  static const baseUrl = "$baseHttp$baseHost$api";
  static const imagebaseUrlcategory = "$baseHttp$baseHost/assets/images/category/";
  static const imagebaseUrlsubcategory = "$baseHttp$baseHost/assets/images/sub_category/";
  static const imagebaseUrlcategoryproduct = "$baseHttp$baseHost/assets/images/products/";

  //list of category

  static const categoryList = "/category"; //Get
  static const subcategoryList = "/sub_category?"; //Get
  static const subcategoryDetailsList = "/sub_category_detail?"; //Get
  static const categoryProduct = "/category_product?"; //Get

}*/

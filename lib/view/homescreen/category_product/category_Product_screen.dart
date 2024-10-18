import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/util/assets_image.dart';
import 'package:rbt_app/util/network_image.dart';
import 'package:rbt_app/view/homescreen/category_product/categoryProduct_notifier.dart';
import 'package:rbt_app/view/homescreen/category_product/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductScreen extends StatefulWidget {
  var title;
  var cat_id;
  var sub_cat_id;
  var multi_sub_cat_id;
  var multi_two_sub_cat_id;
  CategoryProductScreen({required this.title, required this.cat_id , required this.sub_cat_id, required this.multi_sub_cat_id, required this.multi_two_sub_cat_id,super.key});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  TextEditingController _searchController = TextEditingController();

  Widget cards(image, title) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PAssetsImage(
              image,
              height: 80,
            ),
            const SizedBox(height: 5,),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CategoryProductNotifier(context,widget.cat_id,widget.sub_cat_id,widget.multi_sub_cat_id,widget.multi_two_sub_cat_id),
        child:  Consumer<CategoryProductNotifier>(
            builder: (context, categoryProductNotifier, _){
              return Scaffold(
                  extendBodyBehindAppBar: true,
                //  backgroundColor:AppColors.primaryColor,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: AppColors.primaryColor,
                    title: Text(widget.title),
                    iconTheme: const IconThemeData(color: AppColors.whiteColor),
                  ),
                  body: _subCategoryScreenWidget(context, categoryProductNotifier)
              );
            } ));
  }

  Widget _subCategoryScreenWidget(BuildContext context, CategoryProductNotifier categoryProductNotifier, ){
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              Material(
                elevation: 5.0,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    categoryProductNotifier.filterSubCategories(query);
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  style:
                  const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                    hintText: "Search..",
                      suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30)),
                        child: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13)),
                ),
              ),
              const SizedBox(height: 20.0,),
              categoryProductNotifier.isLoading == false
                ? shimmerEffectUIWidget()
                  : categoryProductNotifier.filteredCategoryProductList.isNotEmpty ?
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:categoryProductNotifier.filteredCategoryProductList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  // return _buildCardItem(context,index, categoryProductNotifier);
                 return GestureDetector(
                     onTap: () {
                       var productImage = categoryProductNotifier.filteredCategoryProductList[index].featuredImage!;
                       var productImage2 = categoryProductNotifier.filteredCategoryProductList[index].featuredImage2!;
                       var productTitle= categoryProductNotifier.filteredCategoryProductList[index].productTitle!;
                       var bearingNo= categoryProductNotifier.filteredCategoryProductList[index].bearingNo!;
                       var oePartNo = categoryProductNotifier.filteredCategoryProductList[index].oePartNo!;
                       var sellingPrice = categoryProductNotifier.filteredCategoryProductList[index].sellingPrice!;
                       var seoMetaDescription= categoryProductNotifier.filteredCategoryProductList[index].seoMetaDescription!;
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => ProductDetailsScreen(productImage,productImage2,productTitle,bearingNo,oePartNo,sellingPrice,seoMetaDescription),
                         ),
                       );
                     },
                     child: _cardItemWidget(context,index, categoryProductNotifier));
                },) : const Center(child: Text("No Data Found")),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
  Widget _cardItemWidget(BuildContext context,index, CategoryProductNotifier categoryProductNotifier){
    return  Padding(
      padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70.0,
          width: MediaQuery.of(context).size.width,
          color: AppColors.grayColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0,right: 10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
                  child: PNetworkImage(
                      AppUrl.imagebaseUrlcategoryproduct+categoryProductNotifier.filteredCategoryProductList[index].featuredImage!,
                    width: MediaQuery.of(context).size.width /3,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 10.0,),
                SizedBox(
                  width: 180,
                  child: Text(categoryProductNotifier.filteredCategoryProductList[index].productTitle!,
                      style: const TextStyle(color: Colors.black,fontSize: 20)),
                ),
                const Spacer(),
                const Icon(Icons.arrow_right),
              ],

            ),
          ),
        ),
      ),
    );
  }


  Widget shimmerEffectUIWidget() =>
      Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white54,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(height: 100),
              );
            },)
      );

}

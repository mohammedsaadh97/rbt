import 'package:flutter/material.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/util/assets_image.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/view/homescreen/category_Product_screen.dart';
import 'package:rbt_app/view/homescreen/multisubcategorydetailslist_notifier.dart';
import 'package:shimmer/shimmer.dart';

class MultiSubCategoryDetailsScreen extends StatefulWidget {
  var title;
  var id;
  var productId;
  var subCategoryId;
  MultiSubCategoryDetailsScreen(this.title,this.id,this.productId,this.subCategoryId,{Key? key}) : super(key: key);

  @override
  State<MultiSubCategoryDetailsScreen> createState() => _MultiSubCategoryDetailsScreenState();
}

class _MultiSubCategoryDetailsScreenState extends State<MultiSubCategoryDetailsScreen> {

  TextEditingController _searchController = TextEditingController();

  Widget cards(image, title) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
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
            SizedBox(
              height: 5,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => MultiSubCategoryDetailsNotifier(context,widget.productId),
        child:  Consumer<MultiSubCategoryDetailsNotifier>(
            builder: (context, mutlisubCategoryDetailsNotifier, _){
              return Scaffold(
                  extendBodyBehindAppBar: true,
                //  backgroundColor:AppColors.primaryColor,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: AppColors.primaryColor,
                    title: Text(widget.title),
                    iconTheme: IconThemeData(color: AppColors.whiteColor),
                  ),
                  body: subCategoryScreenWidget(context, mutlisubCategoryDetailsNotifier)
              );
            } ));
  }

  Widget subCategoryScreenWidget(BuildContext context, MultiSubCategoryDetailsNotifier mutlisubCategoryDetailsNotifier,){
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    mutlisubCategoryDetailsNotifier.filterMultiSubCategories(query);
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  style:
                  TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
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
              SizedBox(height: 20.0,),
              mutlisubCategoryDetailsNotifier.isLoading == false
                  ? shimmerEffectUIWidget()
                  : mutlisubCategoryDetailsNotifier.filteredMultiSubCategoryList.isNotEmpty
              ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:mutlisubCategoryDetailsNotifier.filteredMultiSubCategoryList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        var title = mutlisubCategoryDetailsNotifier.filteredMultiSubCategoryList[index].multiTwoSubCategoryName!;
                        var subCategroyid = mutlisubCategoryDetailsNotifier.filteredMultiSubCategoryList[index].id!;
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>CategoryProductScreen(title:  title,
                            cat_id: widget.productId,
                            sub_cat_id: widget.subCategoryId,
                            multi_sub_cat_id:widget.id ,
                            multi_two_sub_cat_id:subCategroyid
                        )));
                  },

                      child: CardItem(context,index, mutlisubCategoryDetailsNotifier));
                },) : Text("No Data Found")
            ],
          ),
        ),
      ),
    );
  }
  Widget CardItem(BuildContext context,index, MultiSubCategoryDetailsNotifier mutlisubCategoryDetailsNotifier,){
    return  Padding(
      padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70.0,
          width: MediaQuery.of(context).size.width,
          color: AppColors.grayColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(30), // Image radius
                    child: Image.network(AppUrl.imagebaseUrlmultitwosubcategory+mutlisubCategoryDetailsNotifier.filteredMultiSubCategoryList[index].multiTwoSubCategoryImage! ,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 10.0,),
                Text(mutlisubCategoryDetailsNotifier.filteredMultiSubCategoryList[index].multiTwoSubCategoryName!,
                    style: TextStyle(color: Colors.black,fontSize: 20)),
                Spacer(),
                Icon(Icons.arrow_right),
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
                child: const SizedBox(height: 80),
              );
            },)
      );
}

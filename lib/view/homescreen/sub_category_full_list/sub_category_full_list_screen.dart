import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/util/assets_image.dart';
import 'package:rbt_app/view/homescreen/multi_sub_category_full_list/multi_sub_category_full_list_screen.dart';
import 'package:rbt_app/view/homescreen/sub_category_full_list/sub_category_full_list_notifier.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoryFullListScreen extends StatefulWidget {
  var categoryName;
  var categoryId;
  var productId;
  SubCategoryFullListScreen({required this.categoryName,required this.categoryId, required this.productId, super.key});

  @override
  State<SubCategoryFullListScreen> createState() => _SubCategoryFullListScreenState();
}

class _SubCategoryFullListScreenState extends State<SubCategoryFullListScreen> {
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
        create: (BuildContext context) => SubCategoryFullListNotifier(context,widget.categoryId),
        child:  Consumer<SubCategoryFullListNotifier>(
            builder: (context, subCategoryDetailsNotifier, _){
              return Scaffold(
                  extendBodyBehindAppBar: true,
                //  backgroundColor:AppColors.primaryColor,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: AppColors.primaryColor,
                    title: Text(widget.categoryName),
                    iconTheme: const IconThemeData(color: AppColors.whiteColor),
                  ),
                  body: _subCategoryScreenWidget(context, subCategoryDetailsNotifier)
              );
            }
            ),
    );
  }

  Widget _subCategoryScreenWidget(BuildContext context, SubCategoryFullListNotifier subCategoryDetailsNotifier,){
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    subCategoryDetailsNotifier.filterSubCategoriesDetails(query);
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
              subCategoryDetailsNotifier.isLoading == false
                  ? shimmerEffectUIWidget()
                  : subCategoryDetailsNotifier.filteredSubCategoryDetailsList.isNotEmpty ?
               ListView.builder(
                 physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:subCategoryDetailsNotifier.filteredSubCategoryDetailsList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                    var multiSubCategoryName = subCategoryDetailsNotifier.filteredSubCategoryDetailsList[index].multiSubCategoryName!;
                    var multisubCategroyId = subCategoryDetailsNotifier.filteredSubCategoryDetailsList[index].id!;
                    var subCategoryID = widget.categoryId;

                    Navigator.push(context,MaterialPageRoute(builder: (context) =>MultiSubCategoryDetailsScreen(multiSubCategoryName: multiSubCategoryName,
                      multiSubCategoryId: multisubCategroyId,
                      productId: widget.productId,
                      subCategoryId:subCategoryID,
                      )));
                  },
                      child: _cardItemWidget(context,index, subCategoryDetailsNotifier));
                },) : const Text("No Data Found")
            ],
          ),
        ),
      ),
    );
  }
  Widget _cardItemWidget(BuildContext context,index, SubCategoryFullListNotifier subCategoryDetailsNotifier,){
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
                    child: Image.network(AppUrl.imagebaseUrlmultisubcategory+subCategoryDetailsNotifier.filteredSubCategoryDetailsList[index].multiSubCategoryImage! , fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 10.0,),
                SizedBox(
                  width: 180,
                  child: Text(subCategoryDetailsNotifier.filteredSubCategoryDetailsList[index].multiSubCategoryName!,
                      style: TextStyle(color: Colors.black,fontSize: 20)),
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
                child: const SizedBox(height: 80),
              );
            },)
      );
}

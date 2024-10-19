import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/util/network_image.dart';
import 'package:rbt_app/view/homescreen/category_full_list/category_full_list_notifier.dart';
import 'package:rbt_app/view/homescreen/sub_category_full_list/sub_category_full_list_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryFullListScreen extends StatefulWidget {
  var categoryId;
  var categoryName;

  CategoryFullListScreen({required this.categoryId, required this.categoryName ,super.key});

  @override
  State<CategoryFullListScreen> createState() => _CategoryFullListScreenState();
}

class _CategoryFullListScreenState extends State<CategoryFullListScreen> {
  TextEditingController _searchController = TextEditingController();

    @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CategoryFullListNotifier(context, widget.categoryId),
      child: Consumer<CategoryFullListNotifier>(
        builder: (context, subCategoryNotifier, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppColors.primaryColor,
              title: Text(widget.categoryName),
              iconTheme: const IconThemeData(color: AppColors.whiteColor),
            ),
            body: subCategoryScreenWidget(context, subCategoryNotifier),
          );
        },
      ),
    );
  }

  Widget subCategoryScreenWidget(BuildContext context, CategoryFullListNotifier subCategoryNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    subCategoryNotifier.filterSubCategories(query);
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                    hintText: "Search..",
                    suffixIcon: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              subCategoryNotifier.isLoading == false
                  ? shimmerEffectUIWidget()
                  : subCategoryNotifier.filteredSubCategoryList.isNotEmpty ?
              ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: subCategoryNotifier.filteredSubCategoryList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          var subCategoryName = subCategoryNotifier.filteredSubCategoryList[index].subCategoryName!;
                          var subCategroyId = subCategoryNotifier.filteredSubCategoryList[index].id!;
                          var productId = widget.categoryId;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategoryFullListScreen(categoryId: subCategroyId,
                                categoryName: subCategoryName,
                                productId: productId,
                                ),
                            ),
                          );
                        },
                        child: _cardItemWidget(context, index, subCategoryNotifier),
                      );
                    },
                  )
                  : const Center(child: Text("No Data Found")),
              const SizedBox(height: 20.0,)
            ],
          ),
        ),
      ),
    );
  }



  Widget _cardItemWidget(BuildContext context,index, CategoryFullListNotifier subCategoryNotifier,){
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
                    AppUrl.imagebaseUrlsubcategory+subCategoryNotifier.filteredSubCategoryList[index].subCategoryImage!,
                    width: MediaQuery.of(context).size.width /3,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 10.0,),

                SizedBox(
                  width: 180,
                  child: Text(subCategoryNotifier.filteredSubCategoryList[index].subCategoryName!,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.black,fontSize: 16)),
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


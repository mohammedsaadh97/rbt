import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/util/assets_image.dart';
import 'package:rbt_app/util/network_image.dart';
import 'package:rbt_app/view/homescreen/subcategory_details_screen.dart';
import 'package:rbt_app/view/homescreen/subcategorylist_notifier.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoryScreen extends StatefulWidget {
  var title;
  var id;
  SubCategoryScreen(this.title,this.id,{Key? key}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  TextEditingController _searchController = TextEditingController();

    @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SubCategoryNotifier(context, widget.id),
      child: Consumer<SubCategoryNotifier>(
        builder: (context, subCategoryNotifier, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppColors.primaryColor,
              title: Text(widget.title),
              iconTheme: IconThemeData(color: AppColors.whiteColor),
            ),
            body: subCategoryScreenWidget(context, subCategoryNotifier),
          );
        },
      ),
    );
  }

  Widget subCategoryScreenWidget(BuildContext context, SubCategoryNotifier subCategoryNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    subCategoryNotifier.filterSubCategories(query);
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
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
              SizedBox(height: 20.0,),
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
                          var title = subCategoryNotifier.filteredSubCategoryList[index].subCategoryName!;
                          var subCategroyid = subCategoryNotifier.filteredSubCategoryList[index].id!;
                          var productId = widget.id;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategoryDetailsScreen(title, subCategroyid,productId),
                            ),
                          );
                        },
                        child: CardItem(context, index, subCategoryNotifier),
                      );
                    },
                  )
                  : Center(child: Text("No Data Found")),
              SizedBox(height: 20.0,)
            ],
          ),
        ),
      ),
    );
  }



  Widget cards(image, title) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget CardItem(BuildContext context,index, SubCategoryNotifier subCategoryNotifier,){
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
                  child: PNetworkImage(
                    AppUrl.imagebaseUrlsubcategory+subCategoryNotifier.filteredSubCategoryList[index].subCategoryImage!,
                    width: MediaQuery.of(context).size.width /3,
                    fit: BoxFit.fill,
                  ),
                ),

                SizedBox(width: 10.0,),

                Text(subCategoryNotifier.filteredSubCategoryList[index].subCategoryName!,
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


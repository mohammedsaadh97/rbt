import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/utils/app_colors.dart';
import 'package:rbt_app/utils/assets_image.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/view/product/Product_notifier.dart';
import 'package:shimmer/shimmer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
        create: (BuildContext context) => ProductNotifier(context),
        child:  Consumer<ProductNotifier>(
            builder: (context, productNotifier, _){
              return Scaffold(
                  extendBodyBehindAppBar: true,
                //  backgroundColor:AppColors.primaryColor,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: AppColors.primaryColor,
                    title: const Text("Product List"),
                    iconTheme: const IconThemeData(color: AppColors.whiteColor),
                  ),
                  body: subCategoryScreenWidget(context, productNotifier)
              );
            } ));
  }

  Widget subCategoryScreenWidget(BuildContext context, ProductNotifier productNotifier,  ){
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
                    productNotifier.filterProductList(query);
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
              productNotifier.isLoading == false
                ? shimmerEffectUIWidget()
                  : productNotifier.filteredProductList.isNotEmpty ?
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:productNotifier.filteredProductList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return _buildCardItem(context,index,productNotifier );
                  //CardItem(context,index, categoryProductNotifier);
                },) : const Center(child: Text("No Data Found")),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCardItem(BuildContext context,index, ProductNotifier productNotifier,) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      //height: 200,
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                          image: CachedNetworkImageProvider( AppUrl.imagebaseUrlcategoryproduct+productNotifier.filteredProductList[index].featuredImage!,),
                      ),
                      borderRadius: const BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:  Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0)
                      ]),
                )
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(productNotifier.filteredProductList[index].productTitle!,
                     //   maxLines: 2,
                       // overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black,fontSize: 20)),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Bearing No : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                              text: productNotifier.filteredProductList[index].bearingNo!,
                              style: const TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'OE Part Number : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text: productNotifier.filteredProductList[index].oePartNo!,
                            style: const TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Price : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text:"₹" +productNotifier.filteredProductList[index].sellingPrice!,
                            style: const TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Description : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text: productNotifier.filteredProductList[index].seoMetaDescription ?? "",
                            style: const TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
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
                child: const SizedBox(height: 160),
              );
            },)
      );

}

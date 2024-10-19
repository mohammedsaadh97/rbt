import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/utils/app_colors.dart';
import 'package:rbt_app/utils/network_image.dart';
import 'package:rbt_app/view/product/Product_screen.dart';
import 'package:rbt_app/view/about_us/about_us_screen.dart';
import 'package:rbt_app/view/contact_us/contact_us.dart';
import 'package:rbt_app/view/homescreen/Home/categorylist_notifier.dart';
import 'package:rbt_app/view/homescreen/category_full_list/category_full_list_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String greetingTime = "";
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return greetingTime = 'Good Morning';
    }
    if (hour < 17) {
      return greetingTime ='Good Afternoon';
    }
    return greetingTime ='Good Evening';
  }

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    greeting();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CategoryListNotifier(context),
        child: Consumer<CategoryListNotifier>(
            builder: (context, categoryNotifier, _) {
              return Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: AppColors.whiteColor,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: AppColors.primaryColor,
                    title: Text(greetingTime),
                    iconTheme: const IconThemeData(color: AppColors.whiteColor),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        const DrawerHeader(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                          ), //BoxDecoration
                          child: UserAccountsDrawerHeader(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,),
                            accountName: Text(
                              "RBT",
                              style: TextStyle(fontSize: 18),
                            ),
                            accountEmail: Text("rbt_app@gmail.com"),
                            currentAccountPictureSize: Size.square(50),
                            currentAccountPicture: CircleAvatar(
                              radius: 120,
                              backgroundColor: AppColors.whiteColor,
                              backgroundImage: AssetImage('assets/logo.png'),
                            ),
                          ),
                        ), //DrawerHeader
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text(' Home '),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.production_quantity_limits),
                          title: const Text('Product'),
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>ProductScreen()));
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('About Us'),
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>const AboutUS()));
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.contact_mail),
                          title: const Text('Contact Us'),
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>const ContactUs()));
                          },
                        ),
                      ],
                    ),
                  ),
                  body: _homeScreenWidget(context, categoryNotifier)
              );
            }));
  }

  Widget _homeScreenWidget(BuildContext context,
      CategoryListNotifier categoryNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: AppColors.primaryColor,
                  ),
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (query) {
                        categoryNotifier.filterCategories(query);
                      },
                      cursorColor: Theme
                          .of(context)
                          .primaryColor,
                      style:
                      const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: const InputDecoration(
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                            BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search),
                          ), hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0,),
                    categoryNotifier.filteredCategoryList.length != 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),
                      itemCount:categoryNotifier.filteredCategoryList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  GestureDetector(
                          onTap: (){
                            var categoryName = categoryNotifier.filteredCategoryList[index].categoryName!;
                            var categoryId = categoryNotifier.filteredCategoryList[index].id!;
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>CategoryFullListScreen(categoryId: categoryId,categoryName: categoryName,)));
                          },
                            child: VehicleContainer( image:AppUrl.imagebaseUrlcategory + categoryNotifier.filteredCategoryList[index].categoryImage! , title: categoryNotifier.filteredCategoryList[index].categoryName ?? "",  ));
                      },)
                  : const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget shimmerEffectUIWidget() =>
      Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white54,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 8,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 200, height: 200, child: Container(color: Colors.grey,),);
          },
        ),
      );

}


class VehicleContainer extends StatelessWidget {
  final String image;
  final String title;

  const VehicleContainer({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 5.0),
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        child: Container(
          height: 140.0,
          width: MediaQuery.of(context).size.width,
          //color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0,right: 10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),bottomLeft:Radius.circular(0) ),
                  child: PNetworkImage(
                    image,
                    width: MediaQuery.of(context).size.width /2,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 20.0,),
                Text(title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(color: Colors.black,fontSize: 22)),
                const Spacer(),
                const Icon(Icons.arrow_right,size: 30.0,),
              ],

            ),
          ),
        ),
      ),
    );
  }
}



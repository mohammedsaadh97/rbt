import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/view/Product_screen.dart';
import 'package:rbt_app/view/about_us_screen.dart';
import 'package:rbt_app/view/contact_us.dart';
import 'package:rbt_app/view/homescreen/categorylist_notifier.dart';
import 'package:rbt_app/view/homescreen/subcategory_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

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
    greeting();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CategoryNotifier(context),
        child: Consumer<CategoryNotifier>(
            builder: (context, categoryNotifier, _) {
              return Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: AppColors.whiteColor,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: AppColors.primaryColor,
                    //title: Text("Good Morning"),
                    title: Text(greetingTime),
                    iconTheme: IconThemeData(color: AppColors.whiteColor),
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>AboutUS()));
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.contact_mail),
                          title: const Text('Contact Us'),
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>ContactUs()));
                          },
                        ),
                      ],
                    ),
                  ),
                  body: HomeScreenWidget(context, categoryNotifier)
              );
            }));
  }

  Widget HomeScreenWidget(BuildContext context,
      CategoryNotifier categoryNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
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
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (query) {
                        categoryNotifier.filterCategories(query);
                      },
                      cursorColor: Theme
                          .of(context)
                          .primaryColor,
                      style:
                      TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
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
                  SizedBox(height: 20.0,),
                    categoryNotifier.filteredCategoryList.length != 0
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          ),
                      itemCount:categoryNotifier.filteredCategoryList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  GestureDetector(
                          onTap: (){
                            var title = categoryNotifier.filteredCategoryList[index].categoryName!;
                            var id = categoryNotifier.filteredCategoryList[index].id!;
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>SubCategoryScreen(title,id)));
                          },
                          //  child: cards( AppUrl.imagebaseUrlcategory + categoryNotifier.filteredCategoryList[index].categoryImage! , categoryNotifier.filteredCategoryList[index].categoryName ?? ""));
                            child: VehicleContainer( image:AppUrl.imagebaseUrlcategory + categoryNotifier.filteredCategoryList[index].categoryImage! , title: categoryNotifier.filteredCategoryList[index].categoryName ?? "",  ));
                      },)
                  : Center(child: CircularProgressIndicator()),
                  SizedBox(height: 20.0,),
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
    return FittedBox(
      child: Container(
        height: 180,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                image,
                height: 120,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}



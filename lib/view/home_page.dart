import 'package:flutter/material.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/util/assets.dart';
import 'package:rbt_app/util/assets_image.dart';
import 'package:rbt_app/util/network_image.dart';
import 'package:rbt_app/view/Homeview/2w_3w_screen.dart';

class HomeScreendup extends StatelessWidget {
   HomeScreendup({Key? key}) : super(key: key);

  Widget cards(image, title) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white70.withOpacity(0.9),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor:AppColors.primaryColor,
          title: Text("Good Morning"),
          iconTheme: IconThemeData(color:AppColors.whiteColor),
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
                  decoration: BoxDecoration(color:AppColors.primaryColor,),
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
                  ) ,
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
                leading: const Icon(Icons.person),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: AppColors.primaryColor,
                ),
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.only(left: 90, bottom: 20),
                width: 299,
                height: 230,
                decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(160),
                        bottomLeft: Radius.circular(290),
                        bottomRight: Radius.circular(160),
                        topRight: Radius.circular(10))),
              ),
              CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextField(
                              controller:
                              TextEditingController(text: 'Search...'),
                              cursorColor: Theme.of(context).primaryColor,
                              style:
                              TextStyle(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
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
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(26.0),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>TwoWThreeWScreen()));
                               },
                            child: cards(twoWThreeW, '2W & 3W')),
                        cards(cars, 'CARS and MUV'),
                        cards(tractors, 'TRACTORS'),
                        cards(trucks, 'TRUCKS & CV'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

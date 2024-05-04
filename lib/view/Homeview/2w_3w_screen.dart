import 'package:flutter/material.dart';
import 'package:rbt_app/util/app_colors.dart';

class TwoWThreeWScreen extends StatefulWidget {
  const TwoWThreeWScreen({Key? key}) : super(key: key);

  @override
  State<TwoWThreeWScreen> createState() => _TwoWThreeWScreenState();
}

class _TwoWThreeWScreenState extends State<TwoWThreeWScreen> {
  Widget CardItem(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
                    child: Image.network('https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60', fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10.0,),
                Text("Bicycle",style: TextStyle(color: Colors.black,fontSize: 20)),
                Spacer(),
                Icon(Icons.arrow_right),
              ],

            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // backgroundColor: Colors.orangeAccent.shade700,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.primaryColor,
          title: Text("2W & 3W",style: TextStyle(color: Colors.white),),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
              child: Material(
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
                        elevation: 2.0,color: AppColors.primaryColor,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30)),
                        child: Icon(Icons.search,color: AppColors.whiteColor),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                  itemBuilder:(context, index) {
                    return CardItem(context);
                  }, ),
            )

          ],
        ),
      ),
    );
  }
}

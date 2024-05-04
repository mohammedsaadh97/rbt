import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/view/contactus_notifier.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ContactUsNotifier(context),
      child: Consumer<ContactUsNotifier>(
        builder: (context, contactusNotifier, _) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: AppColors.primaryColor,
                title: Text("Contact Us"),
                iconTheme: IconThemeData(color: AppColors.whiteColor),
              ),
              body: AboutusWidget(context,contactusNotifier)
          );
        },
      ),
    );
  }

  Widget AboutusWidget(BuildContext context, ContactUsNotifier contactusNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              contactusNotifier.isLoading == false
                  ? Center(child: CircularProgressIndicator())
                  : contactusNotifier.contactUsListData.isNotEmpty ?
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: contactusNotifier.contactUsListData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return  Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 5,),
                              Expanded(
                                child: Text(contactusNotifier.contactUsListData[index].address!,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Icon(Icons.call),
                              SizedBox(width: 5,),
                              Text(contactusNotifier.contactUsListData[index].contactNumber!),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Icon(Icons.mail),
                              SizedBox(width: 5,),
                              Text(contactusNotifier.contactUsListData[index].contactEmail!),
                            ],
                          ),
                        ),
                      ],
                    ),
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

}

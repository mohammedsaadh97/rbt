import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:provider/provider.dart';
import 'package:rbt_app/util/app_colors.dart';
import 'package:rbt_app/view/aboutus_notifier.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AboutUsNotifier(context),
      child: Consumer<AboutUsNotifier>(
        builder: (context, aboutusNotifier, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppColors.primaryColor,
              title: Text("About Us"),
              iconTheme: IconThemeData(color: AppColors.whiteColor),
            ),
            body: AboutusWidget(context,aboutusNotifier)
          );
        },
      ),
    );
  }


  Widget AboutusWidget(BuildContext context,AboutUsNotifier aboutusNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              aboutusNotifier.isLoading == false
                  ? Center(child: CircularProgressIndicator())
                  : aboutusNotifier.aboutusListData.isNotEmpty ?
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: aboutusNotifier.aboutusListData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return  ListTile(
                 //   title: HtmlWidget(aboutusNotifier.aboutusListData[index].aboutContent),
                    title:  WebTextHtml(context,aboutusNotifier.aboutusListData[index].aboutContent),
                  //  title: Text(aboutusNotifier.aboutusListData[index].aboutContent),
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
  Widget WebTextHtml(BuildContext context, dynamic htmlData){
    return Text("data");
    // return  Html(
    //   data: htmlData,
    //   tagsList: Html.tags,
    //   style: {
    //     "table": Style(
    //       backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
    //     ),
    //     "tr": Style(
    //       border: Border(bottom: BorderSide(color: Colors.grey)),
    //     ),
    //     "th": Style(
    //       padding: EdgeInsets.all(6),
    //       backgroundColor: Colors.grey,
    //     ),
    //     "td": Style(
    //       padding: EdgeInsets.all(6),
    //       alignment: Alignment.topLeft,
    //     ),
    //     'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
    //   },
    // );

  }


}

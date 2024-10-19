import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:rbt_app/utils/app_colors.dart';
import 'package:rbt_app/view/about_us/aboutus_notifier.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({super.key});

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
              title: const Text("About Us"),
              iconTheme: const IconThemeData(color: AppColors.whiteColor),
            ),
            body: _aboutUsWidget(context,aboutusNotifier)
          );
        },
      ),
    );
  }


  Widget _aboutUsWidget(BuildContext context,AboutUsNotifier aboutusNotifier) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutusNotifier.isLoading == false
                  ? const Center(child: CircularProgressIndicator())
                  : aboutusNotifier.aboutusListData.isNotEmpty ?
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: aboutusNotifier.aboutusListData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return  ListTile(
                    title:  _webTextHtmlWidget(context,aboutusNotifier.aboutusListData[index].aboutContent),
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
  Widget _webTextHtmlWidget(BuildContext context, dynamic htmlData){
  //  return Text("data");
    return  Html(
      data: htmlData,
     // tagsList: Html.tags,
      style: {
        "table": Style(
          backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
         // padding: EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
        //  padding: EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
      },
    );

  }
}

import 'package:flutter/material.dart';
import 'package:rbt_app/utils/common/app_font.dart';


mixin WidgetHelper {
  Widget buildAppBar(String title, bool isShowBackButton) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
              color: Colors.white, fontWeight: AppFont.fontWeightBold)),
      automaticallyImplyLeading: isShowBackButton,
    );
  }

  Widget buildAppBarWithSearchButton({
    required String title,
    required bool isShowBackButton,
    required Color bgColor,
    required Color titleColor,
    required VoidCallback onBackPress,
    required VoidCallback onClickSearchButton,
    double elevation = 0,
  }) {
    return AppBar(
      title: Text(title,
          style:
              TextStyle(color: titleColor, fontWeight: AppFont.fontWeightBold)),
      automaticallyImplyLeading: isShowBackButton,
      centerTitle: false,
      elevation: elevation,
      backgroundColor: bgColor,
      iconTheme: IconThemeData(color: titleColor),
      leading: onBackPress != null
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: titleColor,
              ),
              onPressed: () => onBackPress(),
            )
          : null,
      actions: [],
    );
  }

  Widget buildAppBarWhite(context, String title,
      {required bool isShowBackButton,
      required VoidCallback onBackPress,
      required bool isShowSearchButton}) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.red, //change your color here
      ),
      backgroundColor: Colors.white,
      title: Text(title, ),
      elevation: 0,
      automaticallyImplyLeading: isShowBackButton,
      leading: isShowBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => onBackPress(),
            )
          : null,
      actions: [

      ],
    );
  }

  Widget showLoadingIndicator({bool isCancelable = false}) {
    return WillPopScope(
      onWillPop: () async => isCancelable,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }

  navigateTo(String routeName) {
    //Catcher.navigatorKey!.currentState!.pushNamed(routeName);
  }

}

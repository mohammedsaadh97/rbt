import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rbt_app/core/data/remote/network/app_url.dart';
import 'package:rbt_app/util/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  var productImage;
  var productImage2;
  var productTitle;
  var bearingNo;
  var oePartNo;
  var sellingPrice;
  var seoMetaDescription;
  ProductDetailsScreen(this.productImage,this.productImage2,this.productTitle,this.bearingNo,this.oePartNo,this.sellingPrice,this.seoMetaDescription,{super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.primaryColor,
          title: Text(widget.productTitle),
          iconTheme: const IconThemeData(color: AppColors.whiteColor),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            _buildCardItem1(context),
          ],
        ),
      )
    );
  }


  Widget _buildCardItem1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      margin: const EdgeInsets.only(bottom: 20.0),

      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: ImageCarousel(
                imageUrls: [
                  AppUrl.imagebaseUrlcategoryproduct + widget.productImage,
                  AppUrl.imagebaseUrlcategoryproduct + widget.productImage2,
              // Add more image URLs if needed
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.productTitle!,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 10), // Adjust the spacing as needed
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Bearing No : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text: widget.bearingNo!,
                            style: TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'OE Part Number : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text: widget.oePartNo!,
                            style: TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Price : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text:"₹" +widget.sellingPrice!,
                            style: TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Description : ',
                            style: TextStyle(color: Colors.grey,fontSize: 18),
                          ),
                          TextSpan(
                            text: widget.seoMetaDescription!,
                            style: TextStyle(color: Colors.black,fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Add other details here using Text or RichText widgets
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  ImageCarousel({required this.imageUrls});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        widget.imageUrls[index],
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20.0,),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                    (index) => _buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage ? AppColors.primaryColor: Colors.grey,
      ),
    );
  }
}




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/model/product_models.dart';
import 'package:badges/badges.dart' as badges;
import 'package:handling/utils/theme.dart';
import 'package:handling/view/widgets/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../logic/controller/cart_controller.dart';
import '../../routes/routes.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key, required this.imageUrl, required productModels});

  final String imageUrl;

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {


  CartController controller = Get.put(CartController());

  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,

  ];
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index,reson){
                setState(() {
                  currentPage = index;
                });
              },
            ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              );
        },
        ),
        Positioned(
          bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.pink,
                dotColor: Colors.black
              ),
            ),
        ),
        Positioned(
          bottom: 30,
            right: 30,
            child: Container(
              height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          outerBorder: currentColor == index,
                          color: colorSelected[index],
                      ),
                    );
                  },
                  separatorBuilder: (context,index)=>SizedBox(height: 3,),
                  itemCount: colorSelected.length,
              ),
            ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                  ),
                ),
              ),
              Obx(() => badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10,end: -10),
                badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,

                ),
                showBadge: true,
                badgeContent: Text(controller.quant().toString()),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.cartScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:handling/logic/controller/product_controller.dart';
import 'package:handling/utils/text_utils.dart';
import 'package:handling/utils/theme.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String titlel;
  final int productId;
  final double rate;
  final String descreption;
   ClothesInfo({super.key, required this.titlel, required this.productId, required this.rate, required this.descreption});
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  titlel,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Obx(() => Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    controller.manageFavItems(productId);
                  },
                  child: controller.isFavItems(productId)
                   ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  )
                  :Icon(
                 Icons.favorite_outline,
                    color: Colors.black,
                 size: 20,
                ),
                ),
              ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: "$rate",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textDecoration: TextDecoration.none,
              ),

            ],
          ),
          SizedBox(height: 20,),
          ReadMoreText(
            descreption,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show More..",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainColor,
              fontSize: 16,
              height: 2,
            ),

          ),
        ],
      ),
    );
  }
}

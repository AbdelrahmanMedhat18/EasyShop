import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/logic/controller/product_controller.dart';

class FavoritesScreen extends StatelessWidget {
   FavoritesScreen({super.key});

  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Obx((){
        if(controller.favList.isEmpty){
         return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                SizedBox(height: 20,),
                Text(
                    'Please , Add Your Fav Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        }else{

          return ListView.separated(
        itemBuilder: (context,index){
        return buildFavItems(
            image: controller.favList[index].image,
          price: controller.favList[index].price,
          title: controller.favList[index].title,
          productId: controller.favList[index].id,

        );
        },
        separatorBuilder: (context, index) {
        return Divider(
        color: Colors.grey,
        thickness: 1,
        );
        },
        itemCount: controller.favList.length,
        );
        }
      }),

    );
  }

  Widget buildFavItems({

     required String image,
    required double price,
    required String title,
    required int productId,
}){

    return Padding(
        padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: (){
                  controller.manageFavItems(productId);
                },
                icon: Icon(Icons.favorite,color: Colors.red,size: 30,),
            ),
          ],
        ),
      ),
    );
  }
}

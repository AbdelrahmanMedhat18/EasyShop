import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/logic/controller/cart_controller.dart';
import 'package:handling/model/product_models.dart';
import 'package:handling/view/screens/product_details.dart';


import '../../logic/controller/product_controller.dart';
import '../../utils/theme.dart';

class CardItems extends StatelessWidget {
   CardItems({super.key});

   ProductController controller = Get.put(ProductController());
   CartController controller2 = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value){
        return Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      }else{
        return Expanded(
          child: controller.searchList.isEmpty
              && controller.textEditingController.text.isNotEmpty
              ? Image.asset("assets/images/search_empry_light.png")
          :
          GridView.builder(
            itemCount: controller.searchList.isEmpty ?
            controller.productList.length
                : controller.searchList.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
            ) ,
            itemBuilder: (context,index){
              if(controller.searchList.isEmpty){

                return buildCardItems(
                  image:controller.productList[index].image,
                  price: controller.productList[index].price,
                  rate: controller.productList[index].rating.rate,
                  productId: controller.productList[index].id,
                  productModels: controller.productList[index],
                  onTap: (){
                    Get.to(()=>ProductDetailsScreen(
                      productModels: controller.productList[index],
                    )
                    );
                  },
                );
              }else{
                return buildCardItems(
                  image:controller.searchList[index].image,
                  price: controller.searchList[index].price,
                  rate: controller.searchList[index].rating.rate,
                  productId: controller.searchList[index].id,
                  productModels: controller.searchList[index],
                  onTap: (){
                    Get.to(()=>ProductDetailsScreen(
                      productModels: controller.searchList[index],
                    )
                    );
                  },
                );

              }

            },
          ),
        );
      }
    });
  }

  Widget buildCardItems({
     required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
})

{
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    IconButton(
                      onPressed: (){
                        controller.manageFavItems(productId);
                      },
                      icon:controller.isFavItems(productId)
                          ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          :Icon(
                        Icons.favorite_border_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        controller2.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                    ),

                  ],
                ),
            ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(image,fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$price",
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(left: 3,right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$rate"),
                          Icon(Icons.star_border_outlined,size: 13,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

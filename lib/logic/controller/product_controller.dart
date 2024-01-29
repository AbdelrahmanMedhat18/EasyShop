import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_models.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController{

  //obs is stream
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var favList = <ProductModels>[].obs;
  var storage = GetStorage();

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = storage.read<List>("isFavItems");
    if(storedShoppings!= null){
      favList = storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if(products.isNotEmpty){
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavItems(int productId) async{
    var removeIndex =favList.indexWhere((element) => element.id == productId);
    if(removeIndex >= 0){
      favList.removeAt(removeIndex);
      await storage.remove("isFavItems");
    }else{
      favList.add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavItems", favList);
    }
  }

  bool isFavItems(int productId){

    return favList.any((element) => element.id == productId);
  }

  //Search bar logic
void addSearchToList(String searchName){

    searchName = searchName.toLowerCase();
    searchList.value = productList
        .where((search) {

          var searchTitle = search.title.toLowerCase();
          var searchPrice = search.price.toString().toLowerCase();
          return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName);
        })
        .toList();

    update();
}

void clearSearch(){

    textEditingController.clear();
    addSearchToList("");
}

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/cart_controller.dart';
import '../../logic/controller/main_controller.dart';
import 'package:badges/badges.dart' as badges;
import '../../routes/routes.dart';
import '../../utils/theme.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);


  MainController controller = Get.put(MainController());
  CartController cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
            () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                      () => badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 0,end: 3),
                        badgeAnimation: badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        showBadge: true,
                        badgeContent: Text(cartController.quant().toString()),
                        child: IconButton(
                          onPressed: (){
                            Get.toNamed(Routes.cartScreen);
                          },
                          icon: Image.asset("assets/images/shop.png"),
                        ),
                      ),
                ),
              ],
              backgroundColor: mainColor,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color:  mainColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color:mainColor,
                  ),
                  icon: Icon(
                    Icons.category,
                    color:  Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: mainColor,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color:Colors.black,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}

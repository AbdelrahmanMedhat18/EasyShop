import 'package:get/get.dart';

import '../../view/screens/category_screen.dart';
import '../../view/screens/favorites_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/settings_screen.dart';


class MainController extends GetxController{

  RxInt currentIndex = 0.obs;

  final tabs = [

    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    "Easy Shop",
    "Categories",
    "Favourites",
    "Settings",
  ].obs;

  //Obs Stream change updateing

}

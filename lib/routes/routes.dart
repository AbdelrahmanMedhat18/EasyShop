import 'package:get/get.dart';
import 'package:handling/view/screens/cart_screen.dart';
import 'package:handling/view/screens/main_screen.dart';
import 'package:handling/view/screens/payment_screen.dart';
import 'package:handling/view/screens/settings_screen.dart';
import 'package:handling/view/screens/splashscreen.dart';
import '../view/screens/forgetpassword_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/signup_screen.dart';
import '../view/screens/welcome.dart';


class AppRoutes{

  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  static const splashScreen = Routes.splashScreen;


  static final routes = [
    GetPage(name: Routes.welcomeScreen, page:()=> WelcomeScreen()),
    GetPage(name: Routes.loginScreen, page:()=> LoginScreen()),
    GetPage(name: Routes.signUpScreen, page:()=> SignUpScreen()),
    GetPage(name: Routes.forgetPasswordScreen, page:()=> ForgetPassword()),
    GetPage(name: Routes.mainScreen, page:()=> MainScreen()),
    GetPage(name: Routes.cartScreen, page:()=> CartScreen()),
    GetPage(name: Routes.settingScreen, page:()=> SettingsScreen()),
    GetPage(name: Routes.paymentScreen, page:()=> PayMentScreen()),
    GetPage(name: Routes.splashScreen, page:()=> SplashScreen()),



  ];

}


class Routes{

  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const settingScreen = '/settingScreen';
  static const paymentScreen = '/paymentScreen';
  static const splashScreen = '/splashScreen';





}
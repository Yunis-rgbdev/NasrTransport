import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  final List<String> routes = [
    '/home',
    '/services',
    '/rates',
    '/order',
    '/fleet',
    '/about',
    '/contact',
  ];

  void changePage(int index) {
    selectedIndex.value = index;
    Get.offNamed(routes[index]);
  }
}
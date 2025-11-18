import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/route_controller.dart';
import 'home_page.dart';
import 'services_page.dart';
import 'rates_page.dart';
import 'order_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    final pages = [
      HomePage(),
      const ServicesPage(),
      const RatesPage(),
      const OrderPage(),
      const Center(child: Text('Fleet Page')),
      const Center(child: Text('About Page')),
      const Center(child: Text('Contact Page')),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // Page content
         body: Obx(() => pages[controller.selectedIndex.value]),
      ),
    );
  }
}

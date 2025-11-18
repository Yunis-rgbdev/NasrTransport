import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasr_transport/layouts/main_layout.dart';
import 'package:nasr_transport/pages/home_page.dart';
import 'pages/main_screen.dart';
import 'pages/services_page.dart';
import 'pages/rates_page.dart';
import 'pages/order_page.dart';
import 'pages/fleet_page.dart';
// import 'pages/about_page.dart';
// import 'pages/contact_page.dart';

void main() {
  
  runApp(
    
    const NasrTaybadApp(),
  );
}

class NasrTaybadApp extends StatelessWidget {
  const NasrTaybadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nasr Taybad',
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => const MainLayout(child: MainScreen())),
          GetPage(name: '/services', page: () => const MainLayout(child: ServicesPage())),
          GetPage(name: '/rates', page: () => const MainLayout(child: RatesPage())),
          GetPage(name: '/order', page: () => const MainLayout(child: OrderPage())),
          GetPage(name: '/fleet', page: () => const MainLayout(child: FleetPage())),
          GetPage(name: '/about', page: () => const MainLayout(child: MainScreen())),
          GetPage(name: '/contact', page: () => const MainLayout(child: MainScreen())),
        ],
      ),
    );
  }
}

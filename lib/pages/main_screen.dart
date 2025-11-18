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
      const Center(child: Text('Contact Page  ')),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // Page content
            body: Obx(() => pages[controller.selectedIndex.value]),
          
        
        // AppBar Row 1
        // appBar: AppBar(
        //   backgroundColor: const Color(0xFF0F172A),
        //   elevation: 4,
        //   title: Row(
        //     children: [
        //       Icon(Icons.local_shipping, color: Colors.blue[300], size: 32),
        //       const SizedBox(width: 12),
        //       const Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'نصر تایباد',
        //             style: TextStyle(
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white,
        //             ),
        //           ),
        //           Text(
        //             'حمل و نقل کالا',
        //             style: TextStyle(
        //               fontSize: 12,
        //               color: Color(0xFF93C5FD),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        //   actions: [
        //     TextButton.icon(
        //       onPressed: () {},
        //       icon: const Icon(Icons.phone, color: Color(0xFF93C5FD), size: 16),
        //       label: const Text(
        //         '051-54555403',
        //         style: TextStyle(color: Color(0xFF93C5FD), fontSize: 14),
        //       ),
        //     ),
        //     const SizedBox(width: 8),
        //     TextButton.icon(
        //       onPressed: () {},
        //       icon: const Icon(Icons.email, color: Color(0xFF93C5FD), size: 16),
        //       label: const Text(
        //         'info@nasrtaybad.co.ir',
        //         style: TextStyle(color: Color(0xFF93C5FD), fontSize: 14),
        //       ),
        //     ),
        //     const SizedBox(width: 16),
        //     ElevatedButton(
        //       onPressed: () => controller.changePage(3),
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: const Color(0xFF2563EB),
        //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //       ),
        //       child: const Text('ثبت سفارش', style: TextStyle(color: Colors.white)),
        //     ),
        //     const SizedBox(width: 16),
        //   ],
        // ),

        // // Body with Top Navigation + Page
        // body: Column(
        //   children: [
        //     // Row 2: Top Navigation under AppBar
        //     Container(
        //       color: const Color(0xFF1E293B),
        //       height: 50,
        //       child: Obx(() {
        //         final selected = controller.selectedIndex.value;
        //         return Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             _topNavItem('خانه', 0, selected, controller),
        //             _topNavItem('خدمات', 1, selected, controller),
        //             _topNavItem('تعرفه‌ها', 2, selected, controller),
        //             _topNavItem('ثبت سفارش', 3, selected, controller),
        //             _topNavItem('ناوگان', 4, selected, controller),
        //             _topNavItem('درباره ما', 5, selected, controller),
        //             _topNavItem('تماس', 6, selected, controller),
        //           ],
        //         );
        //       }),
        //     ),

            

            // Optional Footer
            // const FooterWidget(),
    //       ],
    //     ),
    //   ),
    // );
    ));
  }

  // Top Navigation Button
  // Widget _topNavItem(String title, int index, int selectedIndex, MainController controller) {
  //   final isSelected = selectedIndex == index;
  //   return InkWell(
  //     onTap: () => controller.changePage(index),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         border: Border(
  //           bottom: BorderSide(
  //             color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
  //             width: 3,
  //           ),
  //         ),
  //       ),
  //       child: Text(
  //         title,
  //         style: TextStyle(
  //           color: isSelected ? Colors.white : const Color(0xFF94A3B8),
  //           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
  //           fontSize: 15,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

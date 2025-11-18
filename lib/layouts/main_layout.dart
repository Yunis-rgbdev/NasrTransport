import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              // Icon(Icons.local_shipping, color: Colors.blue[300], size: 32),
              // const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('نصر تایباد',
                      style: PersianFonts.Shabnam.copyWith(fontSize: 20, color: Colors.white)),
                  Text('حمل و نقل کالا',
                      style: PersianFonts.Shabnam.copyWith(fontSize: 12, color: Color(0xFF93C5FD))),
                ],
              ),
            ],
          ),
          actions: [
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, // ensures center alignment
        children: [
          // TextButton with zero padding
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(12),          // remove internal padding
              minimumSize: const Size(0, 0),     // remove min Material constraints
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // remove vertical extra space
              visualDensity: VisualDensity.standard,
              overlayColor: Colors.white54
            ),
            child: TextButton(onPressed: () => launchUrlString('https://app.enasrtransport.ir'), child: Text('ورود مشتریان', style: PersianFonts.Shabnam.copyWith(color: Color(0xFF93C5FD), fontSize: 16),))
          ),

          const SizedBox(width: 16),

          // Normal text, vertically aligned
          const Align(
            alignment: Alignment.center,
            child: Text(
              '051-54555403',
              style: TextStyle(
                color: Color(0xFF93C5FD),
                fontSize: 16,
                height: 1, // ensures the same baseline height
              ),
            ),
          ),
          const SizedBox(width: 8.0,)
        ],
      ),
    ),
  ],
        ),

        // 👇 Top navigation bar under appbar
        body: Column(
          children: [
            // SEDOND TOP NAVIGATION BAR
            // Container(
            //   color: const Color(0xFF1E293B),
            //   height: 50,
            //   // child: Row(
            //   //   mainAxisAlignment: MainAxisAlignment.center,
            //   //   children: [
            //   //     // _navItem('خانه', '/home'),
            //   //     // _navItem('خدمات', '/services'),
            //   //     // _navItem('تعرفه‌ها', '/rates'),
            //   //     // _navItem('ثبت سفارش', '/order'),
            //   //     // _navItem('ناوگان', '/fleet'),
            //   //     // _navItem('درباره ما', '/about'),
            //   //     // _navItem('تماس', '/contact'),
            //   //   ],
            //   // ),
            // ),
            Expanded(child: child),
            
          ],
        ),
      ),
      
    );
  }

  Widget _navItem(String title, String route) {
    return TextButton(
      onPressed: () => Get.toNamed(route),
      child: Text(title, style: PersianFonts.Shabnam.copyWith(color: Colors.white)),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:async';

// // Splash Screen with Full Screen Intro
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
    
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );
    
//     _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
//     );
    
//     _controller.forward();
    
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const MainScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFF0F172A),
//               Color(0xFF1E3A8A),
//               Color(0xFF0F172A),
//             ],
//           ),
//         ),
//         child: Center(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: ScaleTransition(
//               scale: _scaleAnimation,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.local_shipping,
//                     size: 120,
//                     color: Colors.blue[300],
//                   ),
//                   const SizedBox(height: 30),
//                   const Text(
//                     'شرکت حمل و نقل نصر تایباد',
//                     style: TextStyle(
//                       fontSize: 48,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'سرعت، دقت و اعتماد در هر مسیر',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.blue[200],
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   SizedBox(
//                     width: 100,
//                     child: LinearProgressIndicator(
//                       backgroundColor: Colors.blue[900],
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[300]!),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Main Screen with Navigation
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const HomePage(),
//     const ServicesPage(),
//     const RatesPage(),
//     const OrderPage(),
//     // const FleetPage(),
//     // const AboutPage(),
//     // const ContactPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF0F172A),
//           elevation: 4,
//           title: Row(
//             children: [
//               Icon(Icons.local_shipping, color: Colors.blue[300], size: 32),
//               const SizedBox(width: 12),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'نصر تایباد',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'حمل و نقل کالا',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Color(0xFF93C5FD),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             TextButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.phone, color: Color(0xFF93C5FD), size: 16),
//               label: const Text(
//                 '051-54555403',
//                 style: TextStyle(color: Color(0xFF93C5FD), fontSize: 14),
//               ),
//             ),
//             const SizedBox(width: 8),
//             TextButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.email, color: Color(0xFF93C5FD), size: 16),
//               label: const Text(
//                 'info@nasrtaybad.co.ir',
//                 style: TextStyle(color: Color(0xFF93C5FD), fontSize: 14),
//               ),
//             ),
//             const SizedBox(width: 16),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 3;
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF2563EB),
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//               child: const Text('ثبت سفارش', style: TextStyle(color: Colors.white)),
//             ),
//             const SizedBox(width: 16),
//           ],
//         ),
//         body: Column(
//           children: [
//             Container(
//               color: const Color(0xFF1E293B),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildNavItem('خانه', 0, Icons.home),
//                   _buildNavItem('خدمات', 1, Icons.business_center),
//                   _buildNavItem('تعرفه‌ها', 2, Icons.monetization_on),
//                   _buildNavItem('ثبت سفارش', 3, Icons.add_shopping_cart),
//                   _buildNavItem('ناوگان', 4, Icons.local_shipping),
//                   _buildNavItem('درباره ما', 5, Icons.info),
//                   _buildNavItem('تماس', 6, Icons.contact_phone),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: _pages[_selectedIndex],
//             ),
//             // const FooterWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(String title, int index, IconData icon) {
//     final isSelected = _selectedIndex == index;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
//               width: 3,
//             ),
//           ),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF94A3B8),
//               size: 20,
//             ),
//             const SizedBox(width: 8),
//             Text(
//               title,
//               style: TextStyle(
//                 color: isSelected ? Colors.white : const Color(0xFF94A3B8),
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 fontSize: 15,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Home Page
// class _HomePage extends StatelessWidget {
//   const _HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Hero Section
//           Container(
//             height: 500,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [
//                   Color(0xFF0F172A),
//                   Color(0xFF1E3A8A),
//                 ],
//               ),
//             ),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'حمل و نقل کالا با اطمینان و سرعت',
//                     style: TextStyle(
//                       fontSize: 48,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'بیش از 33 سال تجربه در حمل و نقل داخلی و ترانزیت',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF93C5FD),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF2563EB),
//                       padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       'ثبت سفارش جدید',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Quick Quote Form
//           Container(
//             padding: const EdgeInsets.all(40),
//             color: Colors.grey[100],
//             child: Card(
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'دریافت سریع قیمت',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'مبدا',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               prefixIcon: const Icon(Icons.location_on),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'مقصد',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               prefixIcon: const Icon(Icons.location_on),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: DropdownButtonFormField<String>(
//                             decoration: InputDecoration(
//                               labelText: 'نوع وسیله',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               prefixIcon: const Icon(Icons.local_shipping),
//                             ),
//                             items: const [
//                               DropdownMenuItem(value: 'نیسان', child: Text('نیسان')),
//                               DropdownMenuItem(value: 'خاور', child: Text('خاور')),
//                               DropdownMenuItem(value: 'کامیون', child: Text('کامیون')),
//                             ],
//                             onChanged: (value) {},
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'وزن (کیلوگرم)',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               prefixIcon: const Icon(Icons.scale),
//                             ),
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF2563EB),
//                         padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
//                       ),
//                       child: const Text('محاسبه قیمت', style: TextStyle(fontSize: 16, color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Services Overview
//           Container(
//             padding: const EdgeInsets.all(60),
//             child: Column(
//               children: [
//                 const Text(
//                   'خدمات ما',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildServiceCard(
//                         'نیسان',
//                         'حمل بار سبک تا 2 تن',
//                         Icons.airport_shuttle,
//                         const Color(0xFF3B82F6),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: _buildServiceCard(
//                         'خاور',
//                         'حمل بار متوسط تا 5 تن',
//                         Icons.local_shipping,
//                         const Color(0xFF8B5CF6),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: _buildServiceCard(
//                         'کامیون',
//                         'حمل بار سنگین بالای 5 تن',
//                         Icons.fire_truck,
//                         const Color(0xFFEC4899),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: _buildServiceCard(
//                         'اسباب کشی',
//                         'جابجایی اثاثیه منزل',
//                         Icons.home,
//                         const Color(0xFF10B981),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Why Choose Us
//           Container(
//             padding: const EdgeInsets.all(60),
//             color: const Color(0xFF0F172A),
//             child: Column(
//               children: [
//                 const Text(
//                   'چرا نصر تایباد؟',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildFeature(
//                       Icons.verified_user,
//                       'بیمه کامل کالا',
//                       'تمامی محموله‌ها بیمه شده',
//                     ),
//                     _buildFeature(
//                       Icons.speed,
//                       'سرعت بالا',
//                       'تحویل به موقع تضمین شده',
//                     ),
//                     _buildFeature(
//                       Icons.support_agent,
//                       'پشتیبانی 24 ساعته',
//                       'پیگیری لحظه‌ای بار',
//                     ),
//                     _buildFeature(
//                       Icons.history,
//                       '33 سال سابقه',
//                       'تجربه و اعتماد',
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Stats Section
//           Container(
//             padding: const EdgeInsets.all(60),
//             color: Colors.blue[50],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildStat('55,110', 'بار حمل شده در سال 1404'),
//                 _buildStat('5,000', 'مشتری راضی'),
//                 _buildStat('150+', 'شهرهای تحت پوشش'),
//                 _buildStat('24/7', 'پشتیبانی'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildServiceCard(String title, String description, IconData icon, Color color) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(icon, size: 48, color: color),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[600],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeature(IconData icon, String title, String description) {
//     return Column(
//       children: [
//         Icon(icon, size: 64, color: const Color(0xFF3B82F6)),
//         const SizedBox(height: 16),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           description,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Color(0xFF93C5FD),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStat(String number, String label) {
//     return Column(
//       children: [
//         Text(
//           number,
//           style: const TextStyle(
//             fontSize: 48,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF2563EB),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey[700],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Services Page
// class ServicesPage extends StatelessWidget {
//   const ServicesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'خدمات حمل و نقل',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 40),
//             _buildDetailedService(
//               'حمل و نقل با نیسان',
//               'مناسب برای بارهای سبک تا 2 تن',
//               'ابعاد بارگیر: 2.5m × 1.5m × 1.5m\nظرفیت وزنی: حداکثر 2000 کیلوگرم\nمناسب برای: کالاهای خرده‌فروشی، لوازم منزل کوچک',
//               Icons.airport_shuttle,
//               const Color(0xFF3B82F6),
//             ),
//             _buildDetailedService(
//               'حمل و نقل با خاور',
//               'مناسب برای بارهای متوسط تا 5 تن',
//               'ابعاد بارگیر: 4m × 2m × 2m\nظرفیت وزنی: حداکثر 5000 کیلوگرم\nمناسب برای: بار عمومی، مصالح ساختمانی',
//               Icons.local_shipping,
//               const Color(0xFF8B5CF6),
//             ),
//             _buildDetailedService(
//               'حمل و نقل با کامیون',
//               'مناسب برای بارهای سنگین بالای 5 تن',
//               'ابعاد بارگیر: 6m × 2.5m × 2.5m\nظرفیت وزنی: 5 تا 20 تن\nمناسب برای: بار صنعتی، ماشین‌آلات، کالای عمده',
//               Icons.fire_truck,
//               const Color(0xFFEC4899),
//             ),
//             _buildDetailedService(
//               'خدمات اسباب کشی',
//               'جابجایی اثاثیه منزل و اداری',
//               'بسته‌بندی حرفه‌ای\nبیمه کامل اثاثیه\nنیروی کار ماهر\nتضمین سلامت کالا',
//               Icons.home,
//               const Color(0xFF10B981),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailedService(String title, String subtitle, String details, IconData icon, Color color) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.only(bottom: 24),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, size: 48, color: color),
//             ),
//             const SizedBox(width: 24),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     subtitle,
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     details,
//                     style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.6),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Rates Page
// class RatesPage extends StatelessWidget {
//   const RatesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'تعرفه حمل و نقل',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'تعرفه‌های زیر برای سال 1404 می‌باشد',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 40),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Table(
//                   border: TableBorder.all(color: Colors.grey[300]!, width: 1),
//                   columnWidths: const {
//                     0: FlexColumnWidth(3),
//                     1: FlexColumnWidth(1),
//                     2: FlexColumnWidth(1),
//                   },
//                   children: [
//                     _buildTableRow('شهر یا کارخانه مقصد', 'تعداد', 'ریال', isHeader: true),
//                     _buildTableRow('چادرملو حداقل 1400 تا نیمه اول 1404', '55110', ''),
//                     _buildTableRow('ذوب آهن اصفهان حداقل1401 تا نیمه اول 1404', '5000', ''),
//                     _buildTableRow('سیمان غرب آسیا', '-', '-'),
//                     _buildTableRow('سیمان زاوه', '-', '-'),
//                     _buildTableRow('سیمان شرق', '-', '-'),
//                     _buildTableRow('بندرعباس', '-', '-'),
//                     _buildTableRow('چابهار', '-', '-'),
//                     _buildTableRow('سیرجان', '-', '-'),
//                     _buildTableRow('سیمان قائن', '-', '-'),
//                     _buildTableRow('سیمان اسدیه', '-', '-'),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.blue[50],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.info_outline, color: Colors.blue[700], size: 32),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Text(
//                       'برای دریافت تعرفه دقیق و به‌روز، لطفاً با شماره تماس‌های ذکر شده در بالای صفحه تماس بگیرید.',
//                       style: TextStyle(fontSize: 14, color: Colors.blue[900]),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   TableRow _buildTableRow(String col1, String col2, String col3, {bool isHeader = false}) {
//     final textStyle = TextStyle(
//       fontSize: isHeader ? 16 : 14,
//       fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//       color: isHeader ? Colors.white : Colors.black87,
//     );
    
//     final bgColor = isHeader ? const Color(0xFF1E40AF) : Colors.white;

//     return TableRow(
//       decoration: BoxDecoration(color: bgColor),
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: Text(col1, style: textStyle),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: Text(col2, style: textStyle, textAlign: TextAlign.center),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: Text(col3, style: textStyle, textAlign: TextAlign.center),
//         ),
//       ],
//     );
//   }
// }

// // Order Page
// class OrderPage extends StatefulWidget {
//   const OrderPage({Key? key}) : super(key: key);

//   @override
//   State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _selectedVehicle = 'نیسان';
//   bool _showTrackingSection = false;
  
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'ثبت سفارش جدید',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'فرم کامل ثبت سفارش - آپلود تصویر بارنامه / تصاویر کالا اختیاری',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 40),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               child: Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'اطلاعات فرستنده',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'نام و نام خانوادگی فرستنده',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.person),
//                               ),
//                               validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'شماره تماس فرستنده',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.phone),
//                               ),
//                               keyboardType: TextInputType.phone,
//                               validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'آدرس دقیق مبدا (محل بارگیری)',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                           prefixIcon: const Icon(Icons.location_on),
//                         ),
//                         maxLines: 2,
//                         validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
//                       ),
//                       const SizedBox(height: 32),
//                       const Text(
//                         'اطلاعات گیرنده',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'نام و نام خانوادگی گیرنده',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.person_outline),
//                               ),
//                               validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'شماره تماس گیرنده',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.phone),
//                               ),
//                               keyboardType: TextInputType.phone,
//                               validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'آدرس دقیق مقصد (محل تخلیه)',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                           prefixIcon: const Icon(Icons.location_city),
//                         ),
//                         maxLines: 2,
//                         validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
//                       ),
//                       const SizedBox(height: 32),
//                       const Text(
//                         'مشخصات محموله',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: DropdownButtonFormField<String>(
//                               value: _selectedVehicle,
//                               decoration: InputDecoration(
//                                 labelText: 'نوع وسیله نقلیه',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.local_shipping),
//                               ),
//                               items: const [
//                                 DropdownMenuItem(value: 'نیسان', child: Text('نیسان')),
//                                 DropdownMenuItem(value: 'خاور', child: Text('خاور')),
//                                 DropdownMenuItem(value: 'کامیون 10 تن', child: Text('کامیون 10 تن')),
//                                 DropdownMenuItem(value: 'کامیون 20 تن', child: Text('کامیون 20 تن')),
//                                 DropdownMenuItem(value: 'تریلی', child: Text('تریلی')),
//                               ],
//                               onChanged: (value) {
//                                 setState(() {
//                                   _selectedVehicle = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'وزن تقریبی (کیلوگرم)',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.scale),
//                               ),
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'نوع کالا',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.category),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'تاریخ بارگیری',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.calendar_today),
//                                 hintText: '1404/01/01',
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 labelText: 'ساعت بارگیری',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.access_time),
//                                 hintText: '08:00',
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: DropdownButtonFormField<String>(
//                               decoration: InputDecoration(
//                                 labelText: 'نوع بارگیری',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                                 prefixIcon: const Icon(Icons.sync_alt),
//                               ),
//                               items: const [
//                                 DropdownMenuItem(value: 'یک طرفه', child: Text('یک طرفه')),
//                                 DropdownMenuItem(value: 'رفت و برگشت', child: Text('رفت و برگشت')),
//                               ],
//                               onChanged: (value) {},
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'توضیحات و نکات مهم (اختیاری)',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                           prefixIcon: const Icon(Icons.description),
//                         ),
//                         maxLines: 3,
//                       ),
//                       const SizedBox(height: 32),
//                       const Text(
//                         'آپلود تصاویر (اختیاری)',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         padding: const EdgeInsets.all(24),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid, width: 2),
//                         ),
//                         child: Column(
//                           children: [
//                             Icon(Icons.cloud_upload, size: 48, color: Colors.grey[400]),
//                             const SizedBox(height: 16),
//                             Text(
//                               'می‌توانید تصاویر بارنامه، کالا یا سایر مدارک را آپلود کنید',
//                               style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(content: Text('فایل انتخاب شد')),
//                                     );
//                                   },
//                                   icon: const Icon(Icons.image),
//                                   label: const Text('تصویر بارنامه'),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.grey[300],
//                                     foregroundColor: Colors.black87,
//                                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 16),
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(content: Text('فایل انتخاب شد')),
//                                     );
//                                   },
//                                   icon: const Icon(Icons.photo_library),
//                                   label: const Text('تصاویر کالا'),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.grey[300],
//                                     foregroundColor: Colors.black87,
//                                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 32),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState?.validate() ?? false) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('سفارش شما با موفقیت ثبت شد. شماره پیگیری: NT-1404-0001\nکارشناسان ما با شما تماس خواهند گرفت.'),
//                                   backgroundColor: Colors.green,
//                                   duration: Duration(seconds: 4),
//                                 ),
//                               );
//                               setState(() {
//                                 _showTrackingSection = true;
//                               });
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF2563EB),
//                             padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: const Text(
//                             'ثبت سفارش',
//                             style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 60),
//             const Divider(height: 1, thickness: 2),
//             const SizedBox(height: 60),
//             // Tracking Section
//             const Text(
//               'پیگیری سفارش',
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'با استفاده از شماره پیگیری یا شماره تماس خود، وضعیت سفارش را پیگیری کنید',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 24),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               child: Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           labelText: 'شماره پیگیری یا شماره تماس',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                           prefixIcon: const Icon(Icons.search),
//                           hintText: 'مثال: NT-1404-0001',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           _showTrackingSection = !_showTrackingSection;
//                         });
//                       },
//                       icon: const Icon(Icons.track_changes),
//                       label: const Text('پیگیری'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF2563EB),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (_showTrackingSection) ...[
//               const SizedBox(height: 32),
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.green[100],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Icon(Icons.check_circle, color: Colors.green[700], size: 32),
//                           ),
//                           const SizedBox(width: 16),
//                           const Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'شماره سفارش: NT-1404-0001',
//                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   'وضعیت: در حال بارگیری',
//                                   style: TextStyle(fontSize: 16, color: Colors.green),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       const Divider(),
//                       const SizedBox(height: 24),
//                       _buildTrackingStep('ثبت سفارش', 'سفارش شما با موفقیت ثبت شد', '1404/01/01 - 10:30', true),
//                       _buildTrackingStep('تخصیص راننده', 'راننده به سفارش اختصاص یافت', '1404/01/01 - 11:00', true),
//                       _buildTrackingStep('در حال بارگیری', 'راننده در محل بارگیری حاضر شد', '1404/01/01 - 14:00', true),
//                       _buildTrackingStep('در مسیر', 'بار در مسیر انتقال به مقصد', '-', false),
//                       _buildTrackingStep('تحویل شده', 'بار با موفقیت تحویل گرفته شد', '-', false),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTrackingStep(String title, String description, String time, bool isCompleted) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 24),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: isCompleted ? const Color(0xFF10B981) : Colors.grey[300],
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   isCompleted ? Icons.check : Icons.circle,
//                   color: Colors.white,
//                   size: 20,
//                 ),
//               ),
//               if (title != 'تحویل شده')
//                 Container(
//                   width: 2,
//                   height: 40,
//                   color: isCompleted ? const Color(0xFF10B981) : Colors.grey[300],
//                 ),
//             ],
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: isCompleted ? Colors.black87 : Colors.grey[600],
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 if (time != '-') ...[
//                   const SizedBox(height: 4),
//                   Text(
//                     time,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Fleet Page
// class FleetPage extends StatelessWidget {
//   const FleetPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'ناوگان حمل و نقل',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'شرکت نصر تایباد دارای ناوگان تحت پوشش شامل انواع کامیون‌ له دار، کمپرسی، اطاق دار، تک، حفت، تریلی و خودروهای سنگین است',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 40),
//             const Text(
//               'انواع وسایل نقلیه',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 24),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildFleetCard(
//                     'نیسان',
//                     'مناسب بارهای سبک',
//                     'ظرفیت: حداکثر 2 تن\nابعاد بارگیر: 2.5×1.5×1.5 متر\nمناسب برای بارهای خرد',
//                     Icons.airport_shuttle,
//                     const Color(0xFF3B82F6),
//                     ['حمل کالاهای خرده‌فروشی', 'حمل لوازم منزل کوچک', 'ارسال سریع در شهر'],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: _buildFleetCard(
//                     'خاور',
//                     'مناسب بارهای متوسط',
//                     'ظرفیت: حداکثر 5 تن\nابعاد بارگیر: 4×2×2 متر\nمناسب برای بار عمومی',
//                     Icons.local_shipping,
//                     const Color(0xFF8B5CF6),
//                     ['حمل مصالح ساختمانی', 'حمل کالای تجاری', 'حمل بار عمده'],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: _buildFleetCard(
//                     'کامیون 10 تن',
//                     'مناسب بارهای سنگین',
//                     'ظرفیت: 5 تا 10 تن\nابعاد بارگیر: 6×2.5×2.5 متر\nقابلیت حمل بار صنعتی',
//                     Icons.fire_truck,
//                     const Color(0xFFEC4899),
//                     ['حمل ماشین‌آلات', 'حمل کالای صنعتی', 'حمل مواد معدنی'],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildFleetCard(
//                     'کامیون 20 تن',
//                     'مناسب بارهای بسیار سنگین',
//                     'ظرفیت: 10 تا 20 تن\nابعاد بارگیر: 9×2.5×3 متر\nمناسب حمل بار عمده',
//                     Icons.fire_truck,
//                     const Color(0xFFF59E0B),
//                     ['حمل سنگ آهن', 'حمل به معادن', 'حمل مواد اولیه به کارخانجات'],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: _buildFleetCard(
//                     'تریلی',
//                     'حمل بار صنعتی و ترانزیت',
//                     'ظرفیت: بالای 20 تن\nابعاد بارگیر: 12×2.5×3 متر\nحمل بارهای استراتژیک',
//                     Icons.fire_truck,
//                     const Color(0xFF10B981),
//                     ['حمل و نقل بین استانی', 'ترانزیت کالا', 'حمل تجهیزات سنگین'],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Expanded(child: SizedBox()),
//               ],
//             ),
//             const SizedBox(height: 60),
//             Container(
//               padding: const EdgeInsets.all(32),
//               decoration: BoxDecoration(
//                 color: Colors.blue[50],
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.blue[200]!, width: 2),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.info_outline, size: 48, color: Colors.blue[700]),
//                   const SizedBox(width: 24),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'کلیه خودروها تحت پوشش بیمه معتبر بوده و مطابق با مقررات ایمنی و محیط زیست فعالیت می‌کنند',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.blue[900],
//                             fontWeight: FontWeight.bold,
//                             height: 1.6,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFleetCard(String title, String subtitle, String specs, IconData icon, Color color, List<String> features) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Container(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, size: 48, color: color),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               title,
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               subtitle,
//               style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               specs,
//               style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.5),
//             ),
//             const SizedBox(height: 16),
//             const Divider(),
//             const SizedBox(height: 12),
//             ...features.map((feature) => Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Row(
//                 children: [
//                   Icon(Icons.check_circle, size: 16, color: color),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       feature,
//                       style: TextStyle(fontSize: 12, color: Colors.grey[700]),
//                     ),
//                   ),
//                 ],
//               ),
//             )).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
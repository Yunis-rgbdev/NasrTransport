import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:nasr_transport/widgets/footer_widget.dart';

// Controllers
class HoverController extends GetxController {
  final RxBool isHovering = false.obs;

  void onHover(bool value) => isHovering.value = value;
}

// Main HomePage
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final responsive = ResponsiveHelper(screenWidth);

      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _HeroSection(responsive: responsive),
              _ServicesSection(responsive: responsive),
              _ManifestoSection(responsive: responsive),
              _AboutSection(responsive: responsive),
              _FooterSection(),
            ],
          ),
        ),
      );
  }
}

// Responsive Helper Class
class ResponsiveHelper {
  final double screenWidth;

  ResponsiveHelper(this.screenWidth);

  bool get isDesktop => screenWidth > 800;
  
  double get headerSize => (screenWidth * 0.06).clamp(16.0, 48.0);
  double get header2Size => (screenWidth * 0.055).clamp(12.0, 42.0);
  double get commentSize => (screenWidth * 0.03).clamp(12.0, 24.0);
  double get paragraphSize => (screenWidth * 0.02).clamp(14.0, 18.0);
}

// Hero Section
class _HeroSection extends StatelessWidget {
  final ResponsiveHelper responsive;

  const _HeroSection({required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/truck_hero2.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment(0.5, 1)
        ),
      ),
      child: Stack(
        children: [
          // Dark overlay for better text readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xFF0F172A).withOpacity(0.7),
                  const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                ],
              ),
            ),
          ),
          // Hero text positioned higher
          Align(
            alignment: const Alignment(0, -0.6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'حمل و نقل کالا با اطمینان و سرعت',
                    textAlign: TextAlign.center,
                    style: PersianFonts.Shabnam.copyWith(
                      fontSize: responsive.headerSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'بیش از 33 سال تجربه در حمل و نقل داخلی و ترانزیت',
                    textAlign: TextAlign.center,
                    style: PersianFonts.Shabnam.copyWith(
                      fontSize: responsive.commentSize,
                      color: const Color(0xFF93C5FD),
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Scroll down icon at bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: AnimatedScrollIcon(),
            ),
          ),
        ],
      ),
    );
  }
}

// Animated Scroll Down Icon
class AnimatedScrollIcon extends StatefulWidget {
  const AnimatedScrollIcon({Key? key}) : super(key: key);

  @override
  State<AnimatedScrollIcon> createState() => _AnimatedScrollIconState();
}

class _AnimatedScrollIconState extends State<AnimatedScrollIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white.withOpacity(0.8),
            size: 48,
          ),
        );
      },
    );
  }
}

// Services Section
class _ServicesSection extends StatelessWidget {
  final ResponsiveHelper responsive;

  const _ServicesSection({required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Column(
        children: [
          Text(
            'خدمات ما',
            style: PersianFonts.Shabnam.copyWith(
              fontSize: responsive.headerSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2D3436),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFFFF8A65),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'حمل و نقل زمینی سنگ آهن ، مواد اولیه معدنی از معادن به کارخانجات و بنادر و سایر کالاها به تمام نقاط ایران و تخلیه با رعایت استانداردهای ایمنی و سرعت عمل بالا',
            textAlign: TextAlign.center,
            style: PersianFonts.Shabnam.copyWith(
              fontSize: responsive.paragraphSize,
              color: Colors.grey[900],
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              final cardWidth = isDesktop ? 280.0 : constraints.maxWidth.clamp(220.0, 380.0);
              final cardHeight = isDesktop ? 270.0 : constraints.maxWidth.clamp(180.0, 270.0);

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _ServiceCard(
                    icon: Icons.support_agent,
                    color: const Color(0xFFFF8A65),
                    title: 'پشتیبانی',
                    description: 'ارائه خدمات پشتیبانی لجستیک برای تجار و صاحبان کالا.',
                    width: cardWidth,
                    height: cardHeight,
                  ),
                  _ServiceCard(
                    icon: Icons.language,
                    color: const Color(0xFF5C6BC0),
                    title: 'ردیابی',
                    description: 'ردیابی آنلاین محموله ها و پشتیبانی 24 ساعته.',
                    width: cardWidth,
                    height: cardHeight,
                  ),
                  _ServiceCard(
                    icon: Icons.location_on_outlined,
                    color: const Color(0xFF4DB6AC),
                    title: 'حمل و نقل زمینی',
                    description: 'حمل و نقل زمینی به کارخانجات و بنادر به تمام نقاط ایران',
                    width: cardWidth,
                    height: cardHeight,
                  ),
                  _ServiceCard(
                    icon: Icons.local_shipping_outlined,
                    color: const Color(0xFF4DD0E1),
                    title: 'ناوگان و تجهیزات',
                    description: 'دارای انواع ناوگان تحت پوشش شامل کامیون لبه دار، کمپرسی، اتاق دار، تک، جفت، تریلی و خودروهای سنگین',
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// Service Card Widget
class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final double width;
  final double height;

  const _ServiceCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HoverController(), tag: title);

    return MouseRegion(
      onEnter: (_) => controller.onHover(true),
      onExit: (_) => controller.onHover(false),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: width,
          height: height,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: controller.isHovering.value
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: PersianFonts.Shabnam.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: PersianFonts.Shabnam.copyWith(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Manifesto Section
class _ManifestoSection extends StatelessWidget {
  final ResponsiveHelper responsive;

  const _ManifestoSection({required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 160),
      color: const Color(0xFF0F172A),
      child: Column(
        crossAxisAlignment: responsive.isDesktop
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'شعار ومنشور کاری شرکت حمل ونقل نصرتایباد:',
            style: PersianFonts.Shabnam.copyWith(
              fontSize: responsive.commentSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'سرعت و دقت در کار, صداقت در گفتار, تلاش در جهت منافع بیشتر مشتری',
            style: PersianFonts.Shabnam.copyWith(
              color: Colors.white,
              fontSize: responsive.header2Size,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 90),
          _buildFeatures(responsive.isDesktop),
        ],
      ),
    );
  }

Widget _buildFeatures(bool isDesktop) {
    final features = [
      _FeatureData(Icons.verified, 'بیمه کامل کالا', 'تمامی محموله‌ها بیمه شده'),
      _FeatureData(Icons.speed, 'سرعت بالا', 'تحویل به موقع تضمینی'),
      _FeatureData(Icons.support_agent, 'پشتیبانی 24 ساعته', 'پیگیری لحظه‌ای بار'),
      _FeatureData(Icons.history, '33 سال سابقه', 'تجربه و اعتماد'),
    ];

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: features
            .map((f) => _FeatureItem(data: f, isDesktop: true))
            .toList(),
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 0.9,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return _FeatureItem(data: features[index], isDesktop: false);
        },
      );
    }
  }
}

class _FeatureData {
  final IconData icon;
  final String title;
  final String description;

  _FeatureData(this.icon, this.title, this.description);
}

class _FeatureItem extends StatelessWidget {
  final _FeatureData data;
  final bool isDesktop;

  const _FeatureItem({required this.data, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isDesktop ? null : 150,
      child: Column(
        children: [
          Icon(
            data.icon,
            size: isDesktop ? 64 : 42,
            color: const Color(0xFF3B82F6),
          ),
          const SizedBox(height: 16),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: PersianFonts.Shabnam.copyWith(
              fontSize: isDesktop ? 20 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: PersianFonts.Shabnam.copyWith(
              fontSize: isDesktop ? 14 : 12,
              color: const Color(0xFF93C5FD),
            ),
          ),
        ],
      ),
    );
  }
}

// About Section
class _AboutSection extends StatelessWidget {
  final ResponsiveHelper responsive;

  const _AboutSection({required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.white,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          _AboutCard(),
          _StatsCards(),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE0E0E0),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'درباره ما',
                  style: PersianFonts.Shabnam.copyWith(
                    color: Colors.black87,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'شرکت نصر تایباد به عنوان اولین شرکت حمل و نقل داخلی با سابقه ای درخشان بیش از 33 سال فعالیت تخصصی خود را در زمینه جا به جایی کالای داخلی، تره بار، گندم و جو، کالای گمرکی و سنگ آهن از معادن مختلف شهرستان تایباد متمرکز نموده است.',
                  style: PersianFonts.Shabnam.copyWith(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'این شرکت همواره تلاش نموده با تکیه بر تجربه ارزشمند، در امر حمل ونقل و تامین کامیون مورد احتیاج کشاورزان، تجار، معادن، شرکتها، کارخانجات و عموم مردم در اسرع وقت و با تکیه بر منشور مشتری مداری نهایت تلاش و ملاحظات راداشته و نسبت به سرعت بخشیدن و دقت درامر حمل و نقل بتواند آرامش خاطر صاحبان کالا را به ارمغان بیاورد.',
                  style: PersianFonts.Shabnam.copyWith(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE0E0E0),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/scania.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 294,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE0E0E0),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.80,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _StatCard('55,110', 'بار حمل شده در سال 1404'),
                _StatCard('5,000', 'مشتری راضی'),
                _StatCard('+150', 'شهر های تحت پوشش'),
                _StatCard('24/7', 'پشتیبانی'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 40,
                color: Color(0xFF494949),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: PersianFonts.Shabnam.copyWith(
                color: const Color(0xFF494949),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Footer Section
class _FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.black,
      child: FooterWidget(),
    );
  }
}
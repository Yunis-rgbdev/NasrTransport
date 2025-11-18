import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';

Widget FooterWidget() {
  return Container(
    color: const Color.fromARGB(255, 7, 18, 36),
    width: double.infinity,
    child: SingleChildScrollView(
      dragStartBehavior: DragStartBehavior.down,
      physics: BouncingScrollPhysics(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 768;
          bool isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
          
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 40 : 60,
              horizontal: isMobile ? 20 : (isTablet ? 40 : 60),
            ),
            child: isMobile
                ? _buildMobileLayout()
                : _buildDesktopLayout(constraints.maxWidth),
          );
        },
      ),
    ),
  );
}

Widget _buildMobileLayout() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildContactSection(),
      const SizedBox(height: 40),
      Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
      const SizedBox(height: 40),
      _buildCertificatesSection(),
    ],
  );
}

Widget _buildDesktopLayout(double maxWidth) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: maxWidth > 1200 ? 3 : 2,
          child: _buildContactSection(),
        ),
        Container(
          width: 1,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(horizontal: 40),
        ),
        Expanded(
          flex: 2,
          child: _buildCertificatesSection(),
        ),
      ],
    ),
  );
}

Widget _buildContactSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "راه های ارتباطی",
        style: PersianFonts.Shabnam.copyWith(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: 100,
        height: 1,
        color: Colors.grey,
      ),
      const SizedBox(height: 20),
      Text(
        'تلفن',
        style: PersianFonts.Shabnam.copyWith(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      _buildContactText(
        'تلفنهای ثابت دفترمرکزی:   54555403-051 الی 54555407-051',
      ),
      const SizedBox(height: 8),
      _buildContactText(
        'تلفنهای ثابت دفتر کرات:   54534242-051, 54534343-051',
      ),
      const SizedBox(height: 8),
      _buildContactText(
        'همراه: 3323-528-0939, 4091-129-0915, 1648-660-0938, 0177-074-0915',
      ),
      const SizedBox(height: 20),
      Text(
        'آدرس',
        style: PersianFonts.Shabnam.copyWith(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      _buildContactText(
        'آدرس دفترمرکزی: شهرستان تایباد-کیلومتر 2 محور خواف – پایانه بارخصوصی تایباد- فاز2جنوبی-غرفه4',
      ),
      const SizedBox(height: 8),
      _buildContactText(
        'دفتر شماره 2: دهستان کرات – ساختمان تعاونی روستایی – شرکت حمل ونقل نصر تایباد',
      ),
      const SizedBox(height: 8),
      _buildContactText(
        'دفتر شماره 3: کرات – بین روستای رهنه وفرزنه – ورودی معدن کوه باخرز',
      ),
    ],
  );
}

Widget _buildCertificatesSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'مجوز ها و گواهینامه ها',
        style: PersianFonts.Shabnam.copyWith(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: 100,
        height: 1,
        color: Colors.grey,
      ),
      const SizedBox(height: 20),
      _buildContactText(
        'پروانه فعالیت رسمی از وزارت راه و شهرسازی سازمان راهداری و حمل و نقل جاده ای.',
      ),
      const SizedBox(height: 12),
      _buildContactText(
        'گواهینامه رعایت استانداردهای HSE ( ایمنی ، بهداشت و محیط زیست )',
      ),
      const SizedBox(height: 12),
      _buildContactText(
        'گواهینامه های ایزو 9001 ، 14001 ، 18001',
      ),
    ],
  );
}

Widget _buildContactText(String text) {
  return Text(
    text,
    style: PersianFonts.Shabnam.copyWith(
      color: Colors.white70,
      fontSize: 15.9,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
  );
}

// Example usage in a page
class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FooterWidget(),
    );
  }
}
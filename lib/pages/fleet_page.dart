import 'package:flutter/material.dart';

Widget _buildFleetCard(String title, String subtitle, String specs, IconData icon, Color color, List<String> features) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 48, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              specs,
              style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.5),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.check_circle, size: 16, color: color),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

class FleetPage extends StatelessWidget {
  const FleetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ناوگان حمل و نقل',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'شرکت نصر تایباد دارای ناوگان تحت پوشش شامل انواع کامیون‌ له دار، کمپرسی، اطاق دار، تک، حفت، تریلی و خودروهای سنگین است',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),
              const Text(
                'انواع وسایل نقلیه',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildFleetCard(
                      'نیسان',
                      'مناسب بارهای سبک',
                      'ظرفیت: حداکثر 2 تن\nابعاد بارگیر: 2.5×1.5×1.5 متر\nمناسب برای بارهای خرد',
                      Icons.airport_shuttle,
                      const Color(0xFF3B82F6),
                      ['حمل کالاهای خرده‌فروشی', 'حمل لوازم منزل کوچک', 'ارسال سریع در شهر'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildFleetCard(
                      'خاور',
                      'مناسب بارهای متوسط',
                      'ظرفیت: حداکثر 5 تن\nابعاد بارگیر: 4×2×2 متر\nمناسب برای بار عمومی',
                      Icons.local_shipping,
                      const Color(0xFF8B5CF6),
                      ['حمل مصالح ساختمانی', 'حمل کالای تجاری', 'حمل بار عمده'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildFleetCard(
                      'کامیون 10 تن',
                      'مناسب بارهای سنگین',
                      'ظرفیت: 5 تا 10 تن\nابعاد بارگیر: 6×2.5×2.5 متر\nقابلیت حمل بار صنعتی',
                      Icons.fire_truck,
                      const Color(0xFFEC4899),
                      ['حمل ماشین‌آلات', 'حمل کالای صنعتی', 'حمل مواد معدنی'],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildFleetCard(
                      'کامیون 20 تن',
                      'مناسب بارهای بسیار سنگین',
                      'ظرفیت: 10 تا 20 تن\nابعاد بارگیر: 9×2.5×3 متر\nمناسب حمل بار عمده',
                      Icons.fire_truck,
                      const Color(0xFFF59E0B),
                      ['حمل سنگ آهن', 'حمل به معادن', 'حمل مواد اولیه به کارخانجات'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildFleetCard(
                      'تریلی',
                      'حمل بار صنعتی و ترانزیت',
                      'ظرفیت: بالای 20 تن\nابعاد بارگیر: 12×2.5×3 متر\nحمل بارهای استراتژیک',
                      Icons.fire_truck,
                      const Color(0xFF10B981),
                      ['حمل و نقل بین استانی', 'ترانزیت کالا', 'حمل تجهیزات سنگین'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue[200]!, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 48, color: Colors.blue[700]),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'کلیه خودروها تحت پوشش بیمه معتبر بوده و مطابق با مقررات ایمنی و محیط زیست فعالیت می‌کنند',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
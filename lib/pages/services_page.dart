import 'package:flutter/material.dart';

Widget _buildDetailedService(String title, String subtitle, String details, IconData icon, Color color) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.only(bottom: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Row(
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
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    details,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.6),
                  ),
                ],
              ),
            ),
          ],
        ),
    ),
  );
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'خدمات حمل و نقل',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            _buildDetailedService(
              'حمل و نقل با نیسان',
              'مناسب برای بارهای سبک تا 2 تن',
              'ابعاد بارگیر: 2.5m × 1.5m × 1.5m\nظرفیت وزنی: حداکثر 2000 کیلوگرم\nمناسب برای: کالاهای خرده‌فروشی، لوازم منزل کوچک',
              Icons.airport_shuttle,
              const Color(0xFF3B82F6),
            ),
            _buildDetailedService(
              'حمل و نقل با خاور',
              'مناسب برای بارهای متوسط تا 5 تن',
              'ابعاد بارگیر: 4m × 2m × 2m\nظرفیت وزنی: حداکثر 5000 کیلوگرم\nمناسب برای: بار عمومی، مصالح ساختمانی',
              Icons.local_shipping,
              const Color(0xFF8B5CF6),
            ),
            _buildDetailedService(
              'حمل و نقل با کامیون',
              'مناسب برای بارهای سنگین بالای 5 تن',
              'ابعاد بارگیر: 6m × 2.5m × 2.5m\nظرفیت وزنی: 5 تا 20 تن\nمناسب برای: بار صنعتی، ماشین‌آلات، کالای عمده',
              Icons.fire_truck,
              const Color(0xFFEC4899),
            ),
            _buildDetailedService(
              'خدمات اسباب کشی',
              'جابجایی اثاثیه منزل و اداری',
              'بسته‌بندی حرفه‌ای\nبیمه کامل اثاثیه\nنیروی کار ماهر\nتضمین سلامت کالا',
              Icons.home,
              const Color(0xFF10B981),
            ),
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';

Widget _buildTrackingStep(String title, String description, String time, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isCompleted ? const Color(0xFF10B981) : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCompleted ? Icons.check : Icons.circle,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              if (title != 'تحویل شده')
                Container(
                  width: 2,
                  height: 40,
                  color: isCompleted ? const Color(0xFF10B981) : Colors.grey[300],
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.black87 : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                if (time != '-') ...[
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }


// Order Page
class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedVehicle = 'نیسان';
  bool _showTrackingSection = false;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ثبت سفارش جدید',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'فرم کامل ثبت سفارش - آپلود تصویر بارنامه / تصاویر کالا اختیاری',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'اطلاعات فرستنده',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'نام و نام خانوادگی فرستنده',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.person),
                              ),
                              validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'شماره تماس فرستنده',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.phone),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'آدرس دقیق مبدا (محل بارگیری)',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.location_on),
                        ),
                        maxLines: 2,
                        validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'اطلاعات گیرنده',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'نام و نام خانوادگی گیرنده',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.person_outline),
                              ),
                              validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'شماره تماس گیرنده',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.phone),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'آدرس دقیق مقصد (محل تخلیه)',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.location_city),
                        ),
                        maxLines: 2,
                        validator: (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'مشخصات محموله',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedVehicle,
                              decoration: InputDecoration(
                                labelText: 'نوع وسیله نقلیه',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.local_shipping),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'نیسان', child: Text('نیسان')),
                                DropdownMenuItem(value: 'خاور', child: Text('خاور')),
                                DropdownMenuItem(value: 'کامیون 10 تن', child: Text('کامیون 10 تن')),
                                DropdownMenuItem(value: 'کامیون 20 تن', child: Text('کامیون 20 تن')),
                                DropdownMenuItem(value: 'تریلی', child: Text('تریلی')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedVehicle = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'وزن تقریبی (کیلوگرم)',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.scale),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'نوع کالا',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.category),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'تاریخ بارگیری',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.calendar_today),
                                hintText: '1404/01/01',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'ساعت بارگیری',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.access_time),
                                hintText: '08:00',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'نوع بارگیری',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.sync_alt),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'یک طرفه', child: Text('یک طرفه')),
                                DropdownMenuItem(value: 'رفت و برگشت', child: Text('رفت و برگشت')),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'توضیحات و نکات مهم (اختیاری)',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.description),
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'آپلود تصاویر (اختیاری)',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid, width: 2),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.cloud_upload, size: 48, color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text(
                              'می‌توانید تصاویر بارنامه، کالا یا سایر مدارک را آپلود کنید',
                              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('فایل انتخاب شد')),
                                    );
                                  },
                                  icon: const Icon(Icons.image),
                                  label: const Text('تصویر بارنامه'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    foregroundColor: Colors.black87,
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('فایل انتخاب شد')),
                                    );
                                  },
                                  icon: const Icon(Icons.photo_library),
                                  label: const Text('تصاویر کالا'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    foregroundColor: Colors.black87,
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('سفارش شما با موفقیت ثبت شد. شماره پیگیری: NT-1404-0001\nکارشناسان ما با شما تماس خواهند گرفت.'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 4),
                                ),
                              );
                              setState(() {
                                _showTrackingSection = true;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'ثبت سفارش',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Divider(height: 1, thickness: 2),
            const SizedBox(height: 60),
            // Tracking Section
            const Text(
              'پیگیری سفارش',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'با استفاده از شماره پیگیری یا شماره تماس خود، وضعیت سفارش را پیگیری کنید',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'شماره پیگیری یا شماره تماس',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'مثال: NT-1404-0001',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showTrackingSection = !_showTrackingSection;
                        });
                      },
                      icon: const Icon(Icons.track_changes),
                      label: const Text('پیگیری'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_showTrackingSection) ...[
              const SizedBox(height: 32),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.check_circle, color: Colors.green[700], size: 32),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'شماره سفارش: NT-1404-0001',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'وضعیت: در حال بارگیری',
                                  style: TextStyle(fontSize: 16, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                      _buildTrackingStep('ثبت سفارش', 'سفارش شما با موفقیت ثبت شد', '1404/01/01 - 10:30', true),
                      _buildTrackingStep('تخصیص راننده', 'راننده به سفارش اختصاص یافت', '1404/01/01 - 11:00', true),
                      _buildTrackingStep('در حال بارگیری', 'راننده در محل بارگیری حاضر شد', '1404/01/01 - 14:00', true),
                      _buildTrackingStep('در مسیر', 'بار در مسیر انتقال به مقصد', '-', false),
                      _buildTrackingStep('تحویل شده', 'بار با موفقیت تحویل گرفته شد', '-', false),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
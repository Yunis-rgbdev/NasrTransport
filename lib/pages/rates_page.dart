import 'package:flutter/material.dart';

 TableRow _buildTableRow(String col1, String col2, String col3, {bool isHeader = false}) {
    final textStyle = TextStyle(
      fontSize: isHeader ? 16 : 14,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      color: isHeader ? Colors.white : Colors.black87,
    );
    
    final bgColor = isHeader ? const Color(0xFF1E40AF) : Colors.white;

    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(col1, style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(col2, style: textStyle, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(col3, style: textStyle, textAlign: TextAlign.center),
        ),
      ],
    );
  }



class RatesPage extends StatelessWidget {
  const RatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تعرفه حمل و نقل',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'تعرفه‌های زیر برای سال 1404 می‌باشد',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Table(
                  border: TableBorder.all(color: Colors.grey[300]!, width: 1),
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    _buildTableRow('شهر یا کارخانه مقصد', 'تعداد', 'ریال', isHeader: true),
                    _buildTableRow('چادرملو حداقل 1400 تا نیمه اول 1404', '55110', ''),
                    _buildTableRow('ذوب آهن اصفهان حداقل1401 تا نیمه اول 1404', '5000', ''),
                    _buildTableRow('سیمان غرب آسیا', '-', '-'),
                    _buildTableRow('سیمان زاوه', '-', '-'),
                    _buildTableRow('سیمان شرق', '-', '-'),
                    _buildTableRow('بندرعباس', '-', '-'),
                    _buildTableRow('چابهار', '-', '-'),
                    _buildTableRow('سیرجان', '-', '-'),
                    _buildTableRow('سیمان قائن', '-', '-'),
                    _buildTableRow('سیمان اسدیه', '-', '-'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue[700], size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'برای دریافت تعرفه دقیق و به‌روز، لطفاً با شماره تماس‌های ذکر شده در بالای صفحه تماس بگیرید.',
                      style: TextStyle(fontSize: 14, color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<Uint8List> generateBookingPdf({
  required String ticketNumber,
  required String bookingDate,
  required String bookingTime,
  required double total,
  required List items,
}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "BOOKING CONFIRMATION",
            style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
          ),

          pw.SizedBox(height: 20),

          pw.Text("Ticket #: $ticketNumber"),
          pw.Text("Date: $bookingDate"),
          pw.Text("Time: $bookingTime"),

          pw.Divider(),

          pw.Text(
            "Items:",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.SizedBox(height: 10),

          ...items.map(
            (item) => pw.Text(
              "${item['name']} x${item['quantity']} - R${item['total']}",
            ),
          ),

          pw.Divider(),

          pw.Text(
            "Total: R$total",
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  return await pdf.save();
}

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<File> generateBookingPdf({
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

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/booking_$ticketNumber.pdf");

  await file.writeAsBytes(await pdf.save());

  return file;
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Future<pw.Document> generateKhmerPdf(Uint8List imageBytes) async {
  final pdf = pw.Document();

  final image = pw.MemoryImage(imageBytes);
  final pageFormat = PdfPageFormat.a4.landscape.copyWith(
    marginBottom: 0,
    marginLeft: 0,
    marginRight: 0,
    marginTop: 0,
  );

  pdf.addPage(
    pw.Page(
      pageFormat: pageFormat,
      build: (pw.Context context) {
        return pw.Center(child: pw.Image(image));
      },
    ),
  );

  return pdf;
}

void showPdfPreview(BuildContext context, pw.Document pdf) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('PDF Preview'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Go back without saving
            },
          ),
        ),
        body: PdfPreview(
          build: (format) => pdf.save(),
          initialPageFormat: PdfPageFormat.a4.landscape,
          allowPrinting: true,
          allowSharing: false,
          onPrinted: (context) async {
            // Trigger saving process after printing
          },
        ),
      ),
    ),
  );
}

Future<void> savePdf(BuildContext context, pw.Document pdf) async {
  // Step 1: User selects a directory
  String? outputDirectory = await FilePicker.platform.getDirectoryPath();

  if (outputDirectory != null) {
    // Step 2: Ask user to enter a file name
    String? fileName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController textController = TextEditingController();
        return AlertDialog(
          title: Text('សូមដាក់ឈ្មោះឯកសារ'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: 'សូមដាក់ឈ្មោះឯកសារ'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('បដិសេធ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('រក្សាទុក'),
              onPressed: () {
                Navigator.of(context).pop(textController.text);
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: "ជោគជ័យ",
                  text: "ឯកសាររបស់លោកអ្នកត្រូវបានរក្សាទុក។",
                  showCancelBtn: false,
                  showConfirmBtn: true,
                  confirmBtnText: "រួចរាល់",
                );
              },
            ),
          ],
        );
      },
    );

    if (fileName != null && fileName.isNotEmpty) {
      // Step 3: Save the PDF with the custom file name
      final filePath = "$outputDirectory/$fileName.pdf";
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      print("PDF saved to: $filePath");
    }
  } else {
    print("User canceled the directory picker");
  }
}

void printDirectlyToPrinter(BuildContext context, pw.Document pdf) async {
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
    format: PdfPageFormat.a4.landscape,
    usePrinterSettings: false, // Uses the printer's default settings
  );
}

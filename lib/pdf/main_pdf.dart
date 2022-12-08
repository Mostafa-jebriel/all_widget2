import 'package:all_widget2/pdf/PdfApi.dart';
import 'package:all_widget2/share_widget.dart';
import 'package:all_widget2/widget/FAB.dart';
import 'package:all_widget2/widget/all_button.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MainPDF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar("PDF"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () async {
                    final pdfFile =
                        await PdfApi.generateCenteredText('Sample Text');
                    PdfApi.openFile(pdfFile);
                  },
                  child: Text("Simple  PDF"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                MaterialButton(
                  onPressed: () async {
                    final pdfFile = await PdfParagraphApi.generate();
                    PdfApi.openFile(pdfFile);
                  },
                  child: Text("Paragraphs  PDF"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                MaterialButton(
                  onPressed: () async {
                    final pdfFile = await PdfApi.generateTable();

                    PdfApi.openFile(pdfFile);
                  },
                  child: Text("Table  PDF"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                MaterialButton(
                  onPressed: () async {
                    final pdfFile = await PdfApi.generateImage();

                    PdfApi.openFile(pdfFile);
                  },
                  child: Text("Image  PDF"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

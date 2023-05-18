import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../modal/pro_detail_modal.dart';

class InvoicePreviewPage extends StatefulWidget {
  const InvoicePreviewPage({Key? key}) : super(key: key);

  @override
  State<InvoicePreviewPage> createState() => _InvoicePreviewPageState();
}

class _InvoicePreviewPageState extends State<InvoicePreviewPage> {
  pw.Document pdf = pw.Document();

  generatePdf() async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Container(
          height: double.infinity,
          width: double.infinity,
          alignment: pw.Alignment.center,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "Name :- ${Globals.firstName} ${Globals.lastName}",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.black,
                ),
              ),
              pw.Text(
                "Contact No. :- ${Globals.contact}",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.black,
                ),
              ),
              pw.Text(
                "Email :- ${Globals.email}",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.black,
                ),
              ),
              pw.Divider(),
              ...cart.map(
                (e) => pw.Column(
                  children: [
                    pw.Container(
                      height: 150,
                      width: double.infinity,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Spacer(),
                          pw.Container(
                            height: 100,
                            width: 150,
                            alignment: pw.Alignment.center,
                            child: pw.Text("Product \n\n${e.title}"),
                          ),
                          pw.Spacer(),
                          pw.Container(
                            height: 100,
                            width: 150,
                            alignment: pw.Alignment.center,
                            child: pw.Text("Price \n\n${e.price}"),
                          ),
                          pw.Spacer(),
                          pw.Container(
                            height: 100,
                            width: 150,
                            alignment: pw.Alignment.center,
                            child: pw.Text("Quantity \n\n${Globals.cartPro}"),
                          ),
                          pw.Spacer(),
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

  @override
  void initState() {
    super.initState();
    generatePdf();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Final Bill",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: PdfPreview(
        build: (format) => pdf.save(),
      ),
    );
  }
}

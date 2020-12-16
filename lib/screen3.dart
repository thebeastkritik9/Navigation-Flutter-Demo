import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfreporter/pdfreporter.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'main.dart';
import 'screen1.dart';
import 'screen2.dart';

class PDFGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PDFReporter Demo', home: _DemoScreen());
  }
}

/// DemoScreen where the PDF is generated
class _DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDFReporter Demo"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => generateReport(context),
          child: Text("Generate and View Test PDF"),
        ),
      ),
    );
  }

  /// Test the the PDFReporter plugin and geerate a report we can save and show
  generateReport(context) async {
    PDFReportDocument pdf = await PDFReporter.createReport(
      paper: PDFDocumentSize(size: DocumentPaperSize.a5, landscape: true),
      margin:
      PDFDocumentMargin(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
    );

    // Add Page Header and numbering
    pdf.setPageHeader("CS-503");
    pdf.setPageNumbering(
      true,
      size: 8.0,
      alignment: PDFDocumentTextAlignment.center,
    );

    // Create the first page
    pdf.newPage();

    pdf.addText("This is Heading1 and should be right aligned",
        alignment: PDFDocumentTextAlignment.right,
        style: pdf.textStyle.heading1);

    pdf.addText("This is Heading2 and should be center aligned",
        alignment: PDFDocumentTextAlignment.center,
        style: pdf.textStyle.heading2);


    pdf.addText(
      "This should be right aligned - Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
          "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
          "content has been created, giving the design and production process more freedom.",
      paragraph: true,
      alignment: PDFDocumentTextAlignment.right,
    );

    pdf.addText(
        "Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
            "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
            "content has been created, giving the design and production process more freedom.",
        paragraph: true,
        backgroundColor: Colors.yellowAccent);

    pdf.addText(
      "Center aligned Text - Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
          "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
          "content has been created, giving the design and production process more freedom.",
      paragraph: true,
      alignment: PDFDocumentTextAlignment.center,
    );

    pdf.newline();

    await pdf.addImage(
      PDFDocumentImage.loadAssetImage("images/cat.png"),
      //x: 200.0,
      //y: 0.0,
      width: 200.0,
      //updateCursor: true
    );

    pdf.addText(
      "Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
          "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
          "content has been created, giving the design and production process more freedom.",
      paragraph: true,
      indent: 205.0,
    );

    pdf.newline(number: 2);

    pdf.addText(
      "1. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
          "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
          "content has been created, giving the design and production process more freedom.",
      paragraph: true,
    );

    pdf.addText(
      "2. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
          "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
          "content has been created, giving the design and production process more freedom.",
      paragraph: true,
      //style: pdf.textStyle.heading1,
      //backgroundColor: Colors.red
    );

    pdf.addText(
      "3. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
          "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
          "content has been created, giving the design and production process more freedom.",
    );

    pdf.addText(
        "4. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
            "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
            "content has been created, giving the design and production process more freedom.",
        backgroundColor: Colors.pink);

    pdf.addText(
        "5. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
            "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
            "content has been created, giving the design and production process more freedom.",
        backgroundColor: Colors.green);

    pdf.addText(
        "6. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
            "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
            "content has been created, giving the design and production process more freedom.",
        backgroundColor: Colors.blue);

    pdf.addText(
        "7. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
            "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
            "content has been created, giving the design and production process more freedom.",
        backgroundColor: Colors.pink);

    pdf.addText(
        "8. Lorem ipsum was conceived as filler text, formatted in a certain way to enable the presentation of graphic elements in documents,"
            "without the need for formal copy. Using Lorem Ipsum allows designers to put together layouts and the form of the content before the"
            "content has been created, giving the design and production process more freedom.",
        backgroundColor: Colors.green);

    var savedfile = await _saveAndViewReport(pdf.asBytes(), "QP1");

    // then pass the file to the viewer if it created OK
    if (savedfile != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PDFViewer(
                pdffile: savedfile,
              )));
    }
  }

  /// THis will save the generated PDF as a file and pass the path of the file to the PDF viewer
  _saveAndViewReport(pdfdoc, documentname) async {
    String pdfFile;
    var directory = await getApplicationDocumentsDirectory();
    String storageDir = "${directory.path}/reports";
    Directory(storageDir).createSync();
    if (Directory(storageDir).existsSync()) {
      pdfFile = "$storageDir/$documentname.pdf";
      var file = File(pdfFile);
      file.writeAsBytesSync(pdfdoc);
    }
    return pdfFile;
  }
}

/// Simple PDF Viewer
class PDFViewer extends StatelessWidget {
  final String pdffile;

  PDFViewer({@required this.pdffile});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      path: pdffile,
    );
  }
}

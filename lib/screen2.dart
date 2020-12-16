import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen3.dart';
import 'screen1.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'Enter',
                    hintText:
                    'Note: Enter the Questions as Strings in CSV format',
                  ),
                  maxLines: null,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                highlightElevation: 10.0,
                hoverColor: Colors.tealAccent,
                textColor: Colors.black87,
                color: Colors.yellowAccent,
                child: Text('Generate PDF'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: ((context) => PDFGenerator()),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

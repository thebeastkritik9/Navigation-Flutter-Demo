import 'package:flutter/material.dart';
import 'screen2.dart';


class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade600,

        // appBar: AppBar(
        //   backgroundColor: Colors.red,
        //   title: Text('Question Paper Generator'),
        // ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'QUESTION PAPER GENERATOR',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                ),
                Text(
                  'WELCOME',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.teal.shade100,
                    fontSize: 15.0,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade300,
                    thickness: 2.5,
                    // indent: 45.0,
                    height: 10.0,
                    // thickness: 10.0,
                    // endIndent: 45.0 ,
                  ),
                ),
                Card(
                  elevation: 10.0,
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  child: ListTile(
                      title: TextField(
                        style: TextStyle(
                          color: Colors.teal.shade500,
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          letterSpacing: 1.0,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Paper Code',
                          hintText: 'Enter the Paper Code',
                        ),
                      ),
                      onTap: () {
                        /* react to the tile being tapped */
                      }),
                ),
                Card(
                  elevation: 10.0,
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  child: ListTile(
                      title: TextField(
                        style: TextStyle(
                          color: Colors.teal.shade500,
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          letterSpacing: 1.0,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Paper Name',
                          hintText: 'Enter the Paper Name',
                        ),
                      ),
                      onTap: () {
                        /* react to the tile being tapped */
                      }),
                ),
                Card(
                  elevation: 10.0,
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  child: ListTile(
                      title: TextField(
                        style: TextStyle(
                          color: Colors.teal.shade500,
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          letterSpacing: 1.0,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Time Allotted',
                          hintText: 'Enter the Max Time Allotted',
                        ),
                      ),
                      onTap: () {
                        /* react to the tile being tapped */
                      }),
                ),
                Card(
                  elevation: 10.0,
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  child: ListTile(
                      title: TextField(
                        style: TextStyle(
                          color: Colors.teal.shade500,
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          letterSpacing: 1.0,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Maximum Marks',
                          hintText: 'Enter the Maximum Marks',
                        ),
                      ),
                      onTap: () {
                        /* react to the tile being tapped */
                      }),
                ),
                RaisedButton(
                  highlightElevation: 10.0,
                  hoverColor: Colors.tealAccent,
                  textColor: Colors.black87,
                  color: Colors.yellowAccent,
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => Screen2()),
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

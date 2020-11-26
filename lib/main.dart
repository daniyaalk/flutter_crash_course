import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('helo'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 50, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/test.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 60,
            ),
            Text('NAME',
                style: TextStyle(color: Colors.indigo, letterSpacing: 3.0)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Daniyaal Khan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('LEVEL',
                style: TextStyle(color: Colors.indigo, letterSpacing: 3.0)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$level',
              style: TextStyle(
                color: Colors.teal[900],
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.email),
                SizedBox(width: 10),
                Text('khandaniyaal2000@gmail.com'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue[900],
        onPressed: () {
          setState(() {
            level += 1;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  bool isVisible = false;
  //
  Widget myItem(String title) {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: EdgeInsets.all(5.0),
      color: Colors.green,
      child: Center(
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Appearing and Fading item'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: isVisible ? Text('Hide Item') : Text('Show Item'),
            color: Colors.amber,
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
          AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: isVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: Visibility(
              visible: isVisible,
              child: myItem('item 1'),
            ),
          ),
          myItem('item 2'),
          myItem('item 3'),
          myItem('item 4'),
          myItem('item 5'),
        ],
      )),
    );
  }
}



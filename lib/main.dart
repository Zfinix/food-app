import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: buildContainer(context),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.2, 0.9],
        colors: [
          Color.fromRGBO(223, 50, 239, 1),
          Color.fromRGBO(244, 17, 40, 1),
        ],
      )),
      child: buildUI(),
    );
  }

  Column buildUI() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          image(),
          Row(
            children: <Widget>[
              customXMargin(40),
              Text('Abstract Painting',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          customYMargin(10),
          Row(
            children: <Widget>[
              customXMargin(40),
              Text('Lorem ipsum por es it para mi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w200)),
            ],
          ),
          customYMargin(20),
          Row(
            children: <Widget>[
              customXMargin(40),
              Text('12 4/5 x 9/5 in \n32.5 x 25 m',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w200)),
            ],
          ),
          customYMargin(80),
          buildFabs()
        ],
      );

  Row buildFabs() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Fab(
            icon: 'download',
            title: 'Save',
          ),
          Fab(
            icon: 'like',
            title: 'Like',
          ),
          Fab(
            icon: 'share',
            title: 'Share',
          )
        ],
      );

  Widget image() => Container(child: Image.asset('assets/images/image.png'));
}

class Fab extends StatelessWidget {
  final String title;
  final String icon;

  const Fab({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {},
          tooltip: '$title',
          child: Image.asset(
            'assets/icons/$icon.png',
            scale: 1.2,
          ),
        ),
        customYMargin(10),
        Text(
          '$title',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

customYMargin(double y) => SizedBox(height: y);
customXMargin(double x) => SizedBox(width: x);

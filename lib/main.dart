import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arts App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
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
  bool isButton = false;
  Image image = Image.asset('assets/images/image.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: buildUI(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column buildUI() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(flex: 3, child: imageBuilder()),
          customYMargin(30),
          Flexible(
            flex: 1,
            child: Text('Opps Page Not Found',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
          ),
          customYMargin(30),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.5, fontWeight: FontWeight.w100)),
            ),
          ),
          customYMargin(150),
          Flexible(flex: 1, child: isButton ? buildFabs() : buildButton())
        ],
      );

  Row buildFabs() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Fab(
            icon: Icons.close,
            title: 'Close',
            onTap: toggleButton,
          ),
          Fab(
            icon: Icons.refresh,
            title: 'Like',
            onTap: toggleButton,
          ),
          Fab(
            icon: Icons.home,
            title: 'Home',
            onTap: toggleButton,
          )
        ],
      );

  Widget imageBuilder() {
    return AnimatedContainer(
      child: image,
      curve: Curves.linear,
      duration: Duration(seconds: 5),
    );
  }

  buildButton() {
    return RaisedButton(
      color: Colors.blueAccent,
      textColor: Colors.white,
      child: Text('Reload'),
      onPressed: toggleButton,
    );
  }

  toggleButton() {
    isButton
        ? setState(() {
            isButton = false;
            image = Image.asset('assets/images/image.png');
          })
        : setState(() {
            isButton = true;
            image = Image.asset('assets/images/night.png');
          });
  }
}

class Fab extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const Fab({
    Key key,
    @required this.title,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: onTap,
            tooltip: '$title',
            child: Icon(
              icon,
              color: Colors.blueAccent,
            )),
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

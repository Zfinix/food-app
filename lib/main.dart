import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: Colors.white,
        primarySwatch: Colors.orange,
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
  Image image = Image.asset('assets/images/food1.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.orange,
            ),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.black87,
            icon: Icon(
              Icons.share,
            ),
          )
        ],
      ),
      body: Center(
        child: buildUI(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  buildSlider() {
    return Container(
        width: screenWidth(context),
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new FoodCard(
              title: 'Barbeque',
              subtitle: 'French, Meat',
              image: 'food2',
              price: '5,500',
            ),
            new FoodCard(
              title: 'Bread Bun',
              subtitle: 'American, Bread',
              image: 'food1',
              price: '2,500',
            ),
          ],
        ));
  }

  Column buildUI() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: buildSlider(),
          ),
          Flexible(
            flex: 2,
            child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 4.0,
                        spreadRadius: 3.5,
                        offset: Offset(0.0, 2)),
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                //   height: 200,
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    customYMargin(10),
                    Divider(),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5, fontWeight: FontWeight.w300)),
                  ],
                )),
          ),
          customYMargin(20),
          Flexible(
            flex: 1,
            child: Container(
                width: (screenWidth(context) * 0.9), child: buildButton()),
          ),
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
    return CupertinoButton(
      color: Colors.orange,
      child: Text(
        'View Ingredients',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
    @required this.price,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (screenWidth(context)*0.9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 210,
              width: (screenWidth(context) * 0.9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: new DecorationImage(
                    image: new AssetImage('assets/images/$image.jpg'),
                    fit: BoxFit.cover,
                  ))),
          ListT 5 ile(
            contentPadding: EdgeInsets.only(left: 43, top: 13),
            title: Text(
              '$title',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                customYMargin(8),
                Text(
                  '$subtitle',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                Divider(),
              ],
            ),
            trailing: Container(
              margin: EdgeInsets.only(
                right: 23,
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                'N $price',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

customYMargin(double y) => SizedBox(height: y);
customXMargin(double x) => SizedBox(width: x);
screenWidth(context) => MediaQuery.of(context).size.width;

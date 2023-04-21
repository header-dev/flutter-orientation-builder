import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Orientation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Layout Orientation'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  double itemWidth = 300;
  double itemHeight = 150;
  Widget layout = Text('');
  Axis direction = Axis.vertical;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Orientation Builder'),
        ),
        body: OrientationBuilder(
          builder: (context, ort) {
            if (ort == Orientation.portrait) {
              itemWidth = 300;
              itemHeight = 150;
              layout = layoutPortrait();
              direction = Axis.vertical;
            } else if (ort == Orientation.landscape) {
              itemWidth = 200;
              itemHeight = 200;
              layout = layoutLandscape();
              direction = Axis.horizontal;
            }

            return SingleChildScrollView(
              scrollDirection: direction,
              padding: EdgeInsets.all(20),
              child: Center(
                child: layout,
              ),
            );
          },
        ),
      );

  Widget layoutPortrait() {
    var text = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven'];
    /*
    var widgets = <Widget>[];
    text.forEach((el) {
      widgets.add(boxContainer(el));
    });

    return Column(
      children: widgets,
    );
    */
    return Column(
      children: List.generate(
        text.length,
        (index) => boxContainer(text[index]),
      ),
    );
  }

  Widget layoutLandscape() {
    var text = ['หนึ่ง', 'สอง', 'สาม', 'สี่', 'ห้า', 'หก', 'เจ็ด'];

    return Row(
      children: List.generate(
        text.length,
        (index) => boxContainer(text[index]),
      ),
    );
  }

  Widget boxContainer(String text) => Container(
        child: Text(
          text,
          textScaleFactor: 1.5,
        ),
        width: itemWidth,
        height: itemHeight,
        color: Colors.black12,
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
      );
}

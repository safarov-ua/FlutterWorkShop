import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Instagram',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return _post(index);
          },
        )
    );
  }
}

Widget _post(index) {
  int startCount = index;

  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/griddynamics.png',
                  width: 35.0,
                ),
                Text(
                  'griddynamics_ua',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 30.0,
            ),
          ],
        ),
        CarouselSlider(
          height: 200.0,
          viewportFraction: 1.0,
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image.network(
                      'https://picsum.photos/id/${startCount + i}/200',
                      fit: BoxFit.cover,
                    )
                );
              },
            );
          }).toList(),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 30.0,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.black,
              size: 30.0,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
              size: 30.0,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 5.0),
          child: Text('Нравится: 58',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )
          )
        ),
        Container(
          child: _description('griddynamics_ua',
            'We seek to make disruptive technologies accessible. For enterprises '
            + 'that create innovative digital products and experiences, Grid Dynamics offers ' 
            + 'close collaboration from digital transformation consulting to early prototypes to enterprise-scale delivery of new digital platforms.')
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            '#flutter #workshop griddynamics_kharkiv #itkharkov #flutter_kharkov',
            style: TextStyle(
              color: Colors.lightBlue
            )
          )
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Row(
            children: <Widget>[
              Text(
                '28 ноября 2019',
                style: TextStyle(
                  color: Colors.grey
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Показать перевод')
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _description(user, text) {
  return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: RichText(
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
              text: '$user  ',
              style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(
              text: '$text',
            ),
          ],
        ),
      )
  );
}

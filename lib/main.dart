// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<String> gridPicPath = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
  ];

  static const List<String> gridRectanglePicPath = [
    'assets/images/r2.png',
    'assets/images/r1.png',
    'assets/images/r2.png',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 128,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 45,
                      child: topBar,
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      flex: 55,
                      child: _searchBar,
                    ),
                  ],
                ),
              ),
            ),
            _gridView,
            _rowRectangleView(size),
            //TODO: detailsHorizontalScrollView  Design
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _rowRectangleView(Size size) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(int i = 0; i < 3; i++)
                  Container(
                    height: size.width / 2.3,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(gridRectanglePicPath[i])),
                    ),
                  ),
              ],
            ),
          );
  }

  AspectRatio get _gridView {
    return AspectRatio(
            aspectRatio: 1.9,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                for(int i = 0; i < 8; i++)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(gridPicPath[i])),
                    ),
                  ),
              ],
            ),
          );
  }

  Row get topBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topTitle,
        Row(
          children: [
            _installApp,
            const SizedBox(width: 15.0),
            _loginIcon,
          ],
        )
      ],
    );
  }

  Icon get _loginIcon => Icon(
    Icons.account_circle_outlined,
    size: 31,
    color: Colors.grey.shade700,
  );

  Container get _installApp {
    return Container(
      width: 125,
      height: 41,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 6.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/hepsi_image_icon.png')),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: const [
              Text(
                'Uygulamayı',
                style: TextStyle(fontSize: 10),
              ),
              Text(
                'İndir',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column get _topTitle {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'hepsiburada',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                          fontSize: 18,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 12,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: 'premium\'u'),
                              TextSpan(
                                  text: ' keşfet',
                                  style: TextStyle(color: Colors.black87)),
                            ]),
                      )
                    ],
                  );
  }

  Material get _searchBar {
    return Material(
                  elevation: 1.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0)
                          + const EdgeInsets.only(top: 3.0),
                      child: TextFormField(
                        cursorColor: Colors.orangeAccent,
                        decoration: InputDecoration(
                          hintText: 'Ürün, kategori veya marka ara',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          icon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey.shade400,
                            size: 32,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                );
  }
}

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> shoes = [
    {"favorite": false, "image": "assets/shoe1.png", "rate": 5.0},
    {"favorite": true, "image": "assets/shoe2.png", "rate": 2.0},
    {"favorite": true, "image": "assets/shoe3.png", "rate": 1.0},
    {"favorite": true, "image": "assets/shoe1.png", "rate": 5.0},
    {"favorite": false, "image": "assets/shoe2.png", "rate": 4.0},
    {"favorite": false, "image": "assets/shoe3.png", "rate": 3.0},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xffEDEADE),
        appBar: AppBar(
          backgroundColor: const Color(0xffEDEADE),
          leading: const Icon(
            Icons.dashboard,
            color: Color(0xff38b6ff),
          ),
          actions: [
            _shoppingCartBadge(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FluttermojiCircleAvatar(
                  radius: 20, backgroundColor: const Color(0xff38b6ff)),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Sports shoes",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune,
                        color: Color(0xff38b6ff),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Sports Shoes",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text.rich(TextSpan(children: [
                          TextSpan(text: 'Sort By'),
                          WidgetSpan(child: Icon(Icons.keyboard_arrow_down))
                        ])))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1 / 1.3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: shoes.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon((shoes[index]["favorite"] == true
                                        ? Icons.favorite
                                        : Icons.favorite_outline)),
                                    onPressed: () {},
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(shoes[index]["image"],
                                      width: 120),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Shoes",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                      text: const TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          children: [
                                        TextSpan(
                                            text: "\$",
                                            style: TextStyle(fontSize: 11)),
                                        TextSpan(
                                            text: "100",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))
                                      ])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: RatingBar.builder(
                                          initialRating: shoes[index]["rate"]!,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          unratedColor: Colors.amberAccent,
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor:
                                              const Color(0xff38b6ff),
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(5),
                                        ),
                                        child: const Icon(Icons.add,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ]));
                    }),
              ),
            ],
          ),
        )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _shoppingCartBadge() {
    return badges.Badge(
        position: badges.BadgePosition.topStart(top: 12, start: 23),
        showBadge: true,
        ignorePointer: false,
        onTap: () {},
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: const Color(0xff38b6ff),
          padding: const EdgeInsets.all(5),
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.white, width: 2),
          elevation: 0,
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
        ));
  }
}

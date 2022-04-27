import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int rng = Random().nextInt(10);
  void generateRandomIndex() {
    rng = Random().nextInt(10);
  }

  final _url = "https://private-anon-dc60d63e9a-carsapi1.apiary-mock.com/cars";
  var _data = [];

  void fetchPost() async {
    try {
      final response = await http.get(Uri.parse(_url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _data = jsonData;
      });
    } catch (err) {
      print("No response from server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchPost();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Image.network("${_data[rng]['img_url']}"),
              const TitleBar(),
              const LinkBar(),
              Center(
                heightFactor: 1.75,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Year: ${_data[rng]['year']}",
                            style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("HP: ${_data[rng]['horsepower']}",
                            style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Price: \$${_data[rng]['price']}",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Container(
            height: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: generateRandomIndex,
          backgroundColor: Color.fromARGB(255, 10, 10, 10),
          child: const Icon(Icons.swap_horizontal_circle_rounded, size: 40),
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "Mercedes",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("SLS - AMG")
              ],
            ),
          ),
          Favorites(),
        ],
      ),
    );
  }
}

class LinkBar extends StatelessWidget {
  const LinkBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: const [
            Icon(
              Icons.car_rental,
              color: Color.fromARGB(255, 10, 145, 255),
              size: 40.0,
            ),
            Text("Rent")
          ]),
          Column(children: const [
            Icon(
              Icons.car_repair,
              color: Colors.blue,
              size: 40.0,
            ),
            Text("Test Drive")
          ]),
          Column(children: const [
            Icon(
              Icons.key,
              color: Color.fromARGB(255, 55, 162, 248),
              size: 40.0,
            ),
            Text("Own")
          ]),
        ],
      ),
    );
  }
}

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool _isFavorited = true;
  int _favoriteCount = 93;

  void _toggleFav() {
    setState(() {
      _isFavorited = !_isFavorited;
      if (_isFavorited) {
        _favoriteCount = 93;
      } else {
        _favoriteCount = 92;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red,
            onPressed: _toggleFav,
          ),
        ),
        SizedBox(
          child: Text("$_favoriteCount"),
        )
      ],
    );
  }
}

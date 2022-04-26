import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Image.network(
                  "https://www.topgear.com/sites/default/files/images/news-article/2018/08/5fea3e9cce58cc4be329b29854e6aa96/2014_mercedes-benz_sls_amg_black_series_0115.jpg"),
              const TitleBar(),
              const LinkBar(),
              Container(
                padding: EdgeInsets.all(18),
                child: const Text(
                    "One is created when Mercedes' in-house AMG performance shop tires of building mere 500-plus-hp commuters and pumps out something that packs the fury and power of a supernova. The 2014 Mercedes-Benz SLS AMG Black Series is the fifth car to earn the badge. The Europe-only SLK55 AMG Black Series of 2006 was the first and was followed by a CLK63, an SL65, and a C63 that were all available here. With an estimated price of \$250,000 and fewer than 200 making their way to the United States, the SLS Black is the most expensive and most exclusive Mercedes of the moment.",
                    style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
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
              children: const [
                Text(
                  "Mercedes SLS Amg Black Series",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("631 HP - 0-60 in 3.3s")
              ],
            ),
          ),
          const Text("93"),
          const Icon(Icons.star, color: Colors.red),
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

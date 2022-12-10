// import 'dart:convert';

// import 'package:cryptify/Components/reusablelistview.dart';
// import 'package:cryptify/Components/Button.dart';
// import 'package:cryptify/TopPerformer.dart';
// import 'package:cryptify/searchSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;
import 'package:cryptify/api.dart';
import './api.dart';
import './network.dart';
import './searchSection.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
// import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<> _color = [];
  List<Crypto> _cryptologo = [];
  List<Crypto> _sorted = [];
  List<Crypto> _random = [];
  // List<Crypto> _found = [];
  // Future<List<Crypto>> apicall() async {
  //   http.Response response;
  //   response = await http.get(Uri.parse(
  //       "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> i in data) {
  //       // crypto.clear();
  //       crypto.add(Crypto.fromJson(i));
  //     }
  //     return crypto;
  //   }
  //   return crypto;
  // }

  @override
  void initState() {
    fetchPost().then((value) {
      if (mounted)
        // ignore: curly_braces_in_flow_control_structures
        setState(() {
          _cryptologo.addAll(value);
          _random.addAll(_cryptologo);
          _random.shuffle();

          _sorted.addAll(_cryptologo);
          _sorted.sort(((b, a) => a.currentPrice!.compareTo(b.currentPrice!)));
          // int k = 0;
          // for (int i in _cryptologo.length) {
          //   _sorted[i] = _cryptologo[k];

          // _cryptologo.sortBy()
          // _cryptologo.sort(
          //   (a, b) {
          //     return b.priceChange24h!.compareTo(a.priceChange24h!);
          //   },
          // );
          // _found = _crypto;
        });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Cryptified",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Container(
                        height: 250,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          // borderRadius: BorderRadius.circular(14)
                        ),
                        child: PageView.builder(
                            itemCount: _random.length,
                            controller: PageController(viewportFraction: 1),
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 250,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 40, 39, 39),
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _random[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                _random[index]
                                                    .symbol
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.grey)),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                                "\$" +
                                                    _random[index]
                                                        .currentPrice
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey)),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                "Low: \$" +
                                                    _random[index]
                                                        .low24h
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey)),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                "high: \$" +
                                                    _random[index]
                                                        .low24h
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _random[index]
                                                      .priceChangePercentage24h
                                                      .toString() +
                                                  "%",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: _random[index]
                                                              .priceChangePercentage24h! <
                                                          0
                                                      ? Colors.red
                                                      : Colors.green),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _random[index]
                                                          .priceChangePercentage24h! >
                                                      0
                                                  ? "BUY"
                                                  : "Sell",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: _random[index]
                                                              .priceChangePercentage24h! <
                                                          0
                                                      ? Colors.red
                                                      : Colors.green),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Bounce(
                                          onPressed: () {},
                                          duration: Duration(milliseconds: 200),
                                          child: Container(
                                            height: 87,
                                            width: 87,
                                            // margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        _random[index]
                                                            .image
                                                            .toString()))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: Text(
                        "Most Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: SingleChildScrollView(
                              child: Center(
                                  child: SizedBox(
                                      width: 800,
                                      height: 130,
                                      child: Card(
                                          color: Colors.transparent,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _cryptologo.length,
                                            itemBuilder: ((context, index) {
                                              return Column(children: [
                                                Bounce(
                                                  onPressed: () {},
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    margin: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                _cryptologo[
                                                                        index]
                                                                    .image
                                                                    .toString()))),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  _cryptologo[index]
                                                      .name
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                )
                                              ]);
                                            }),
                                          ))))))
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: Text(
                        "Top Performers",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: SingleChildScrollView(
                              child: Center(
                                  child: SizedBox(
                                      width: 800,
                                      height: 130,
                                      child: Card(
                                          color: Colors.transparent,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _sorted.length,
                                            itemBuilder: ((context, index) {
                                              return Column(children: [
                                                Bounce(
                                                  onPressed: () {},
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    margin: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                _sorted[index]
                                                                    .image
                                                                    .toString()))),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  _sorted[index]
                                                      .name
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                )
                                              ]);
                                            }),
                                          ))))))
                    ]),
                  ]),
            )));
  }
}

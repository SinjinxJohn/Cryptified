import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:http/http.dart' as http;
import 'package:cryptify/api.dart';

import './network.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<Crypto> _crypto = [];
  List<Crypto> _found = [];
  bool _click = true;
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
      setState(() {
        _crypto.addAll(value);
        _found = _crypto;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  // void runSearch(String key) {
  //   List<Crypto> results = [];
  //   if (key.isEmpty) {
  //     results = crypto;
  //   } else {
  //     results = crypto
  //         .where(
  //             (note) => note.name!.toLowercase().contains(key.toLowerCase()))
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                children: [
                  // FutureBuilder(
                  //     future: apicall(),
                  //     builder: ((context, AsyncSnapshot<List<Crypto>> snapshot) {
                  //       if (!snapshot.hasData) {
                  //         return CircularProgressIndicator();
                  //       }
                  Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          width: 370,
                          height: 750,
                          child: Card(
                            color: Colors.transparent,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: _found.length + 1,
                                itemBuilder: ((context, index) {
                                  if (_found.length > 0) {
                                    return index == 0
                                        ? _searchBar()
                                        : _listItem(index - 1);
                                  } else {
                                    return Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 350),
                                        child: Container(
                                          child: SpinKitFadingCircle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  }
                                })),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Container(
          width: 250,
          child: TextField(
            onChanged: (value) {
              value = value.toLowerCase();
              setState(() {
                _found = _crypto.where((post) {
                  var cryptoname = post.name!.toLowerCase();
                  return cryptoname.contains(value);
                }).toList();
              });
            },
            decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)),
          )),
    );
  }

  _listItem(index) {
    var price_change = _found[index].priceChangePercentage24h;
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 15),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_found[index].image.toString()))),
            ),
            SizedBox(
              width: 3,
            ),

            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                _found[index].name.toString(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              Text(_found[index].symbol.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              SizedBox(
                height: 7,
              ),
              Text("\$" + _found[index].currentPrice.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ]),
            // SizedBox(
            //   width: 50,
            // ),
            Spacer(),

            Text(
              _found[index].priceChangePercentage24h.toString() + "%",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: price_change! < 0 ? Colors.red : Colors.green),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            // Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    _click = !_click;
                  });
                  // icon:
                  // Icon(
                  //   Icons.favorite,
                  //   // color: Colors.red,
                  // );
                },
                icon: Icon(
                  (_click == false) ? Icons.favorite : Icons.favorite_border,
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReusableListView extends StatelessWidget {
  int count;

  dynamic image;
  dynamic name;
  dynamic price;
  dynamic symbol;
  dynamic price_change;
  ReusableListView({
    super.key,
    required this.count,
    required this.image,
    required this.name,
    required this.price,
    required this.symbol,
    required this.price_change,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            height: 500,
            child: Card(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: count,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(image))),
                        ),
                        SizedBox(
                          width: 5,
                        ),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              Text(symbol.toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              SizedBox(
                                height: 7,
                              ),
                              Text("\$" + price.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ]),
                        // SizedBox(
                        //   width: 50,
                        // ),
                        Spacer(),

                        Text(
                          price_change.toString() + "%",
                          style: TextStyle(
                              color:
                                  price_change < 0 ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  })),
            ),
          ),
        ),
      ),
    );
  }
}

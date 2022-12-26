import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double valu = 0;
  List l1 = [
    {'id': '1', 'name': 'Watch', 'price': '5000', 'category': 'wearable'},
    {'id': '2', 'name': 'T-Shirt', 'price': '700', 'category': 'wearable'},
    {'id': '3', 'name': 'Jeans', 'price': '1500', 'category': 'wearable'},
    {'id': '4', 'name': 'Bag', 'price': '2500', 'category': 'wearable'},
    {'id': '5', 'name': 'Followers port', 'price': '300', 'category': 'decoration'},
    {'id': '6', 'name': 'Ear buds', 'price': '5000', 'category': 'accessories'},
    {'id': '7', 'name': 'Bluetooth speaker', 'price': '4500', 'category': 'accessories '},
    {'id': '8', 'name': 'TV ', 'price': '55000', 'category': 'accessories '},
    {'id': '9', 'name': 'Laptop Bag', 'price': '2000', 'category': 'accessories '},
    {'id': '10', 'name': 'Sun Glasses', 'price': '10900', 'category': 'accessories '},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Products Filter",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Slider(
                  max: 80000,
                  divisions: 80,
                  onChanged: (double a) {
                    setState(() {
                      valu = a;
                    });
                  },
                  value: valu,
                ),
                Text(
                  "All Products < Rs. ${valu.toInt()}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Column(
                  children: l1.map((e) {
                    if (double.parse(e['price']) < valu) {
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 2,offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text(e['id'])],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 0)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text(e['name']), Text(e['category'])],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(e['price']),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
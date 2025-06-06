
import 'package:flutter/material.dart';

void main() {
  runApp(DhoniHobarMoja());
}

class DhoniHobarMoja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ধনী হবার মজা',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: GameBoard(),
    );
  }
}

class GameBoard extends StatelessWidget {
  final List<Map<String, String>> boardTiles = [
    {'name': 'শুরু (Start)', 'type': 'start'},
    {'name': 'কক্সবাজার\n(Cox\'s Bazar)', 'type': 'property', 'price': '600'},
    {'name': 'লাকি স্পিন\n(Lucky Spin)', 'type': 'chance'},
    {'name': 'সিলেট\n(Sylhet)', 'type': 'property', 'price': '700'},
    {'name': 'ইনকাম ট্যাক্স\n(Income Tax)', 'type': 'tax'},
    {'name': 'ঢাকা রেলওয়ে\n(Dhaka Railway)', 'type': 'railway', 'price': '800'},
    {'name': 'রাজশাহী\n(Rajshahi)', 'type': 'property', 'price': '900'},
    {'name': 'বিদ্যুৎ বোর্ড\n(Electricity)', 'type': 'utility'},
    {'name': 'চট্টগ্রাম\n(Chattogram)', 'type': 'property', 'price': '950'},
    {'name': 'জেলে যাও\n(Go to Jail)', 'type': 'gotojail'},
    {'name': 'জেল\n(Jail)', 'type': 'jail'},
    {'name': 'বরিশাল\n(Barishal)', 'type': 'property', 'price': '750'},
    {'name': 'লাকি স্পিন\n(Lucky Spin)', 'type': 'chance'},
    {'name': 'খুলনা\n(Khulna)', 'type': 'property', 'price': '850'},
    {'name': 'পানি সংযোগ\n(Water Supply)', 'type': 'utility'},
    {'name': 'রংপুর\n(Rangpur)', 'type': 'property', 'price': '800'},
    {'name': 'রাজশাহী রেলওয়ে\n(Rajshahi Railway)', 'type': 'railway', 'price': '800'},
    {'name': 'ফ্রি পার্কিং\n(Free Parking)', 'type': 'free'},
    {'name': 'লাকি স্পিন\n(Lucky Spin)', 'type': 'chance'},
    {'name': 'উত্তরা\n(Uttara)', 'type': 'property', 'price': '500'},
  ];

  Color getTileColor(String type) {
    switch (type) {
      case 'start':
        return Colors.green;
      case 'property':
        return Colors.orange.shade300;
      case 'railway':
        return Colors.brown.shade300;
      case 'utility':
        return Colors.lightBlue;
      case 'chance':
        return Colors.purple.shade200;
      case 'jail':
      case 'gotojail':
        return Colors.red.shade300;
      case 'tax':
        return Colors.deepOrange;
      case 'free':
        return Colors.grey.shade400;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ধনী হবার মজা')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: boardTiles.length,
        itemBuilder: (context, index) {
          final tile = boardTiles[index];
          return Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: getTileColor(tile['type']!),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black54),
            ),
            child: Center(
              child: Text(
                tile['price'] != null
                    ? '${tile['name']}\n৳${tile['price']}'
                    : tile['name']!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

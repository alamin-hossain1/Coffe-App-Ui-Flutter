import 'package:coffee_app_ui/util/coffee_tile.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  void cofeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
          ),
          Icon(Icons.person)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find The Best Coffee For You",
              style:
                  // GoogleFonts.bebasNeue(),
                  TextStyle(fontSize: 36),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find Your Coffee..",
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ), // Body SearchBar
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeetype: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    cofeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                    coffeeImagePath: 'lib/images/coffee1.jpg',
                    coffeeName: "Cappucino",
                    coffeePrice: '4.20'),
                CoffeeTile(
                    coffeeImagePath: 'lib/images/images.2.jpg',
                    coffeeName: "Latte",
                    coffeePrice: '4.10'),
                CoffeeTile(
                    coffeeImagePath: 'lib/images/coffee1.jpg',
                    coffeeName: "Milk Coffee ",
                    coffeePrice: '4.00'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

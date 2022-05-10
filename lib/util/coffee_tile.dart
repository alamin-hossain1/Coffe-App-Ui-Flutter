import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTile(
      {required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 25),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black54, // to sharpen the Corrners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // coffee image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(coffeeImagePath),
              ),

              // coffee name
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeName,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'With Almond Milk',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              // price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$' + coffeePrice),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(6)),
                          child: Icon(Icons.add),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

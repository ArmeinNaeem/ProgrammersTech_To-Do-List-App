import 'package:flutter/material.dart';
import 'cart_screen.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String restaurantName;

  RestaurantDetailScreen({required this.restaurantName});

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Pizza',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeo_JMT1ZvwUNMHneItLQcNgYbwRsSs2mqYA&s',
      'price': 'RS.1000',
      'description': 'Delicious cheese pizza with a crispy crust.',
    },
    {
      'name': 'Pasta',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSroGydD5IeTyD2r5-DTNtNZjwbXHai3XMq2A&s',
      'price': 'RS.1400',
      'description': 'Creamy Alfredo pasta with grilled chicken.',
    },
    {
      'name': 'Burger',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsz9eXYu1uA-ahCZspJW39V9DyzqgGQ9N5pA&s',
      'price': 'RS.500',
      'description': 'Juicy beef burger with fresh lettuce and tomato.',
    },
    {
      'name': 'Salad',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOIiNbCtvRjdGunEXvzblckJtNTZRe4eYDvw&s',
      'price': 'RS.550',
      'description': 'Fresh garden salad with a variety of vegetables.',
    },
    {
      'name': 'Burrito',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7_P9TDgRQKyRMYHSxzS52qUv5AscWCxtUbg&s',
      'price': 'RS.700',
      'description': 'Fresh Burrito with a variety of sauces.',
    },
  ];

  final List<Map<String, String>> cartItems = [];

  void addToCart(Map<String, String> foodItem) {
    setState(() {
      cartItems.add(foodItem);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${foodItem['name']} added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurantName),
        backgroundColor: Colors.pink[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[700]!,
              Colors.pink[300]!,
            ],
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        foodItem['image']!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            foodItem['name']!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[800],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            foodItem['price']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            foodItem['description']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => addToCart(foodItem),
                            child: Text('Add to Cart'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[700],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(cartItems: cartItems),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.pink[700],
      ),
    );
  }
}

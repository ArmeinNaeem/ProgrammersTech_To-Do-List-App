import 'package:flutter/material.dart';
import 'restaurant_detail_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<Map<String, String>> restaurants = [
    {
      'name': 'Chaaye Khana',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR0bUze2E2oY7HjAuz4Vx2qbmwK4Sg7HFNcw&s', // Replace with actual image URL
      'location': 'Near F-7',
    },
    {
      'name': 'El Momento',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbV_3Dp2f0p741geMZUuTqn1_-rHF_rxakGQ&s',
      'location': 'Near F-10',
    },
    {
      'name': 'Monal',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgvFmFsdntjiTiNvm7JQlNll8LbK_A2Qzohg&s',
      'location': 'Pir Sohawa',
    },

    {
      'name': 'The Smokey Cauldron',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6q2Mb0UDXhuTwlDp7vqhvv6-1ts1GaQiHvQ&s',
      'location': 'Islamabad',
    },

    {
      'name': 'Howdy',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf_2hCg6hNxorS2563KUYmc4ieeWhvtq6Ysw&s',
      'location': 'Near F-6',
    },

    // Add more restaurants as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        backgroundColor: Colors.pink[700], // Matching AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        restaurant['image']!,
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[800],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            restaurant['location']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantDetailScreen(
                        restaurantName: restaurant['name']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

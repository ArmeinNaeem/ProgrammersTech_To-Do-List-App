import 'package:flutter/material.dart';
import 'restaurant_list_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[800], // Dark pink background
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.pink[700], // Slightly lighter pink for AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLnOVf3BEXE8jbPUzeYa57aIV7aVpr5aIAng&s', // Replace with your background image URL
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3), // Dark overlay for readability
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Centered content
          Center(
            child: Container(
              width: 300,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // White background for the container
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi3s0Nqb_6X-xqLP3LmMvqN_2Qc2LqUmLuOg&s', // Replace with your logo/image URL
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to Food Panda',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RestaurantListScreen()),
                      );
                    },
                    child: Text('View Restaurants'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[700], // Button color
                      foregroundColor : Colors.white, // Button text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


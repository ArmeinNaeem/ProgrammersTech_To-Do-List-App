import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Light pink background
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.pink[700], // Matching AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile picture and details
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYNbDroF40bIn8kskE5NiPbHOTFzHCbCEEdQ&s', // Replace with a profile image URL or use an asset
              ),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 20),
            Text(
              'Armein Naeem', // Replace with actual user name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink[700],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'armeinnaeem@gmail.com', // Replace with actual user email
              style: TextStyle(
                fontSize: 16,
                color: Colors.pink[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await _authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[700], // Button background color
                foregroundColor: Colors.white, // Button text color
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

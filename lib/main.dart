// main.dart

import 'package:flutter/material.dart';
import 'package:wander05/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/bg1.jpg', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(), // Spacer to push the content above it to the top
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Wander05',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              const Spacer(), // Spacer to push the next content to the bottom
              Column(
                children: [
                  const Text(
                    'Plan your beautiful vacation',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to explore or navigate to another screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      print('Explore Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    child: const Text('Explore', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

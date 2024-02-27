import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> topDestinations = [
    'Paris',
    'Tokyo',
    'New York',
    'Rome',
    'Sydney',
    'London',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travel_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore the World',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Plan your next adventure with us',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to itinerary generation page
                    },
                    child: Text(
                      'Generate Itinerary',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Top Destinations',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topDestinations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to destination details page
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/${topDestinations[index].toLowerCase()}_image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          topDestinations[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Liked Destinations'),
              onTap: () {
                // Navigate to liked destinations page
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Transport Booking'),
              onTap: () {
                // Navigate to transport booking page
              },
            ),
            ListTile(
              leading: Icon(Icons.hotel),
              title: Text('Hotel Booking'),
              onTap: () {
                // Navigate to hotel booking page
              },
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Weather Alerts'),
              onTap: () {
                // Navigate to weather alerts page
              },
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text('Disaster Alerts'),
              onTap: () {
                // Navigate to disaster alerts page
              },
            ),
          ],
        ),
      ),
    );
  }
}

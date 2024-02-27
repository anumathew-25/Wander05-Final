import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Itinerary extends StatefulWidget {
  const Itinerary({super.key});

  @override
  State<Itinerary> createState() => _ItineraryState();
}

class _ItineraryState extends State<Itinerary> {
  String result='';
  final TextEditingController _controller = TextEditingController();
  // The OpenAI API endpoint
  final String apiUrl = "https://api.openai.com/v1/chat/completions";

  // Replace 'YOUR_API_KEY' with your actual OpenAI API key
  final String apiKey = "API Key Here";

  // Function to make the POST request to the OpenAI API
  Future<void> fetchResponse(String destinationCountry, String budget, String travelStyle, String interestsNew, String accommodationType, String transportationType, String activityType,String cuisineType, String tripDuration, String language ) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "You are a helpful assistant."
          },
          {
            "role": "user",
            "content": "Generate a personalized travel itinerary for a trip to $destinationCountry with a budget of $budget. The traveler is interested in a $travelStyle vacation and enjoys $interestsNew. They are looking for $accommodationType accommodations and prefer $transportationType transportation. The itinerary should include $activityType activities and $cuisineType dining options. Please provide a detailed itinerary with daily recommendations for $tripDuration days, including suggested destinations, activities, and dining options. The itinerary should be written in $language.",
          }
        ],
      }),
    );
    if (response.statusCode == 200) {
  setState(() {
    result = jsonDecode(response.body)['choices'][0]['message']['content'];
  
  }); 
} else {
  // Print the response body for debugging purposes
  print('Request failed with status: ${response.statusCode}.');
  print('Response body: ${response.body}'); // Add this line to help debug
  throw Exception('Failed to load response: ${response.body}');
}
  }
    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('ChatGPT Flutter App'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
               fetchResponse(
                "Munnar","2500" , "relaxation", "Architecture,Nature", "Hotel", "Public Transport", "Outdoor","Traditional", "3", "English"
               ) ;},
              child: Text('Send'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(result),
              ),
            ),
          ],
        ));
  }
}

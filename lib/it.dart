import 'package:flutter/material.dart';

class TripPreferencesPage extends StatefulWidget {
  @override
  _TripPreferencesPageState createState() => _TripPreferencesPageState();
}

class _TripPreferencesPageState extends State<TripPreferencesPage> {
  int _currentStep = 0;

  String? destinationCountry;
  String? budget;
  String? travelStyle;
  List<String> interests = [];
  String? accommodationType;
  String? transportationType;
  String? activityType;
  String? cuisineType;
  String? tripDuration;

  List<String> travelStyles = ['Adventure', 'Relaxation', 'Culture', 'Sightseeing'];
  List<String> accommodationTypes = ['Hotel', 'Resort', 'Hostel', 'Vacation Rental'];
  List<String> transportationTypes = ['Public Transport', 'Rental Car', 'Taxi', 'Bicycle'];
  List<String> activityTypes = ['Outdoor', 'Indoor', 'Sightseeing', 'Cultural', 'Adventure'];
  List<String> cuisineTypes = ['Traditional', 'International', 'Vegetarian', 'Vegan'];
  List<String> tripDurations = ['1', '2', '3', '4', '5', '6', '7+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Preferences'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 7) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: Text('Destination Country'),
            content: _buildDropdownField(
              label: 'Destination Country',
              value: destinationCountry,
              onChanged: (value) {
                setState(() {
                  destinationCountry = value;
                });
              },
            ),
          ),
          Step(
            title: Text('Budget'),
            content: _buildTextField(
              label: 'Budget',
              hint: 'Enter your budget',
              onChanged: (value) {
                setState(() {
                  budget = value;
                });
              },
            ),
          ),
          Step(
            title: Text('Travel Style'),
            content: _buildDropdownField(
              label: 'Travel Style',
              value: travelStyle,
              onChanged: (value) {
                setState(() {
                  travelStyle = value;
                });
              },
              items: travelStyles,
            ),
          ),
          Step(
            title: Text('Interests'),
            content: _buildCheckboxList(
              label: 'Interests',
              values: interests,
              onChanged: (value) {
                setState(() {
                  if (interests.contains(value)) {
                    interests.remove(value);
                  } else {
                    interests.add(value);
                  }
                });
              },
              items: ['Adventure', 'Nature', 'History', 'Food', 'Shopping'],
            ),
          ),
          Step(
            title: Text('Accommodation Type'),
            content: _buildDropdownField(
              label: 'Accommodation Type',
              value: accommodationType,
              onChanged: (value) {
                setState(() {
                  accommodationType = value;
                });
              },
              items: accommodationTypes,
            ),
          ),
          Step(
            title: Text('Transportation Type'),
            content: _buildDropdownField(
              label: 'Transportation Type',
              value: transportationType,
              onChanged: (value) {
                setState(() {
                  transportationType = value;
                });
              },
              items: transportationTypes,
            ),
          ),
          Step(
            title: Text('Activity Type'),
            content: _buildDropdownField(
              label: 'Activity Type',
              value: activityType,
              onChanged: (value) {
                setState(() {
                  activityType = value;
                });
              },
              items: activityTypes,
            ),
          ),
          Step(
            title: Text('Cuisine Type'),
            content: _buildDropdownField(
              label: 'Cuisine Type',
              value: cuisineType,
              onChanged: (value) {
                setState(() {
                  cuisineType = value;
                });
              },
              items: cuisineTypes,
            ),
          ),
          Step(
            title: Text('Trip Duration'),
            content: _buildDropdownField(
              label: 'Trip Duration',
              value: tripDuration,
              onChanged: (value) {
                setState(() {
                  tripDuration = value;
                });
              },
              items: tripDurations,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    String? value,
    required void Function(String?) onChanged,
    List<String>? items,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: items?.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required void Function(String) onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildCheckboxList({
    required String label,
    required List<String> values,
    required void Function(String) onChanged,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 5.0),
        Wrap(
          spacing: 10.0,
          children: items.map((item) {
            return FilterChip(
              label: Text(item),
              selected: values.contains(item),
              onSelected: (selected) {
                onChanged(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}


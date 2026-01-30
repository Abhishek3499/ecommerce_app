import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatelessWidget {
  final List<String> countries = [
    'United States',
    'United Kingdom',
    'Vietnam',
    'India',
    'China',
    'Japan',
    'Germany',
    'France',
    'Canada',
    'Australia',
    'Brazil',
    'Mexico',
    'Italy',
    'Spain',
    'Netherlands',
    'Singapore',
    'Malaysia',
    'Thailand',
    'Indonesia',
    'Philippines',
  ];

  CountrySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      appBar: AppBar(
        title: const Text(
          'Select Country',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "raleway",
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              countries[index],
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Nunito Sans",
                color: Color(0xFF000000),
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              Navigator.pop(context, countries[index]);
            },
          );
        },
      ),
    );
  }
}

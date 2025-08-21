//final choose_language_screen.dart
import 'package:flutter/material.dart';
import 'package:cstech_assignment/screens/register_screen.dart';

class ChooseLanguageScreen extends StatefulWidget {
  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String selectedLanguage = "English"; // default selection

  final List<Map<String, String>> languages = [
    {"name": "English", "sub": "Hi"},
    {"name": "Hindi", "sub": "नमस्ते"},
    {"name": "Bengali", "sub": "হ্যালো"},
    {"name": "Kannada", "sub": "ನಮಸ್ಕಾರ"},
    {"name": "Punjabi", "sub": "ਸਤ ਸ੍ਰੀ ਅਕਾਲ"},
    {"name": "Tamil", "sub": "வணக்கம்"},
    {"name": "Telugu", "sub": "హలో"},
    {"name": "French", "sub": "Bonjour"},
    {"name": "Spanish", "sub": "Hola"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Choose Your Language",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Language List
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final lang = languages[index];
                      return RadioListTile<String>(
                        title: Text(lang["name"]!),
                        subtitle: Text(lang["sub"]!),
                        value: lang["name"]!,
                        groupValue: selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value!;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Select Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to RegisterScreen later
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) => RegisterScreen(),
                      ),
                    );
                    print("Selected: $selectedLanguage");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Select",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    "Flutter", "Dart", "Java", "Spring Boot", "BLoC", "GetX",
    "Firebase", "REST API", "Bluetooth", "SQLite", "Hive",
    "Git", "GitHub", "Jira", "Trello", "Xcode", "Android Studio",
    "Firebase Auth", "FCM", "Crashlytics", "Localization"
  ];

  Widget skillChips(List<String> skills) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: skills
          .map(
            (e) => Chip(
          label: Text(e),
          backgroundColor: Colors.blue.shade50,
          labelStyle: const TextStyle(color: Colors.blueAccent),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blue.shade200),
          ),
        ),
      )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Skills",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              skillChips(skills),
            ],
          ),
        ),
      ),
    );
  }
}

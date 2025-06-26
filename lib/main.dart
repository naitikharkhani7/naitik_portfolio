import 'package:flutter/material.dart';
import 'package:portfolio_web/footer_section.dart';
import 'package:portfolio_web/project_section_widget.dart';
import 'package:portfolio_web/skill_section.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_section.dart';
import 'contact_section.dart';
import 'experience_widget.dart';
import 'header_section.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naitik Harkhani | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            HeaderSection(),
            const SizedBox(height: 40),

            AboutMeSection(),
            const SizedBox(height: 30),

            SkillsSection(),
            const SizedBox(height: 30),

            ExperienceSection(),
            const SizedBox(height: 30),


            ProjectsSection(),
            const SizedBox(height: 30),

            ContactSection(),

            FooterSection()
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(text, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
  }


  static Widget contactLink(String emoji, String label, String url) {
    return TextButton.icon(onPressed: () => launchURL(url), icon: Text(emoji), label: Text(label));
  }

  static void launchURL(String url) async {
    final mainUrl = Uri.parse(url);
    if (!await launchUrl(mainUrl)) {
      throw Exception('Could not launch $mainUrl');
    }
  }

}

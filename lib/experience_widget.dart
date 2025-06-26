
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
    );
  }

  Widget jobTile(String company, String role, String time, String desc) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$role @ $company", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 6),
          Text(time, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(desc),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: Column(
        children: [
          // Top Flutter Logo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
              height: 60,
            ),
          ),

          sectionTitle("Experience"),

          // Horizontal Scrollable Experience Tiles
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                jobTile(
                  "Lets Talk Business Pvt Ltd",
                  "Flutter Developer",
                  "April 2023 - Present",
                  "Working on Zyapaar (B2B networking app) with clean architecture, BLoC, Reels, CRM, Chat, Product Catalog.",
                ),
                jobTile(
                  "BigWelt Infotech Pvt Ltd",
                  "Flutter Developer",
                  "Jan 2022 - Mar 2023",
                  "Job portal, eCommerce, and school apps with modules like login, listing, Bluetooth attendance.",
                ),
                jobTile(
                  "XR Studio LLP - Surat",
                  "Flutter Developer",
                  "Jan 2021 - Dec 2021",
                  "Chat App, Door Lock (Rook), Car Trading, Fantasy Cricket (Free Fantasy), Bluetooth integrations.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

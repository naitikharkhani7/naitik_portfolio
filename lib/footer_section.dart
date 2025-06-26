import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget socialIcon(String assetPath, String url, {double size = 24}) {
    return IconButton(
      onPressed: () => launchURL(url),
      icon: Image.asset(assetPath, height: size, width: size),
      tooltip: url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          const Divider(thickness: 1.2),
          const SizedBox(height: 16),

          // Optional Social Links Row
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              socialIcon("assets/icons/github.png", "https://github.com/yourgithub"),
              socialIcon("assets/icons/linkedin.png", "https://linkedin.com/in/yournaitik"),
              socialIcon("assets/icons/twitter.png", "https://twitter.com/yourhandle"),
              // Add or remove as needed
            ],
          ),
          const SizedBox(height: 16),

          // Footer Text
          const Text(
            "© 2025 Naitik Harkhani | All Rights Reserved",
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

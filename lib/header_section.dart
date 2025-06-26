import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  Widget contactLink(String emoji, String label, String url) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          Container(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/50122916?v=4',
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Name
          const Text(
            "Naitik Harkhani",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Title
          const Text(
            "Flutter Developer | Mobile Engineer",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          // Contact Links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              contactLink("🌐", "naitikharkhani.com", "https://naitikharkhani.com"),
              contactLink("📧", "Email", "mailto:naitikharkhani1@gmail.com"),
              contactLink("🔗", "LinkedIn", "https://www.linkedin.com/in/naitik-harkhani"),
              contactLink("💻", "GitHub", "https://github.com/naitikharkhani"),
            ],
          ),
        ],
      ),
    );
  }
}

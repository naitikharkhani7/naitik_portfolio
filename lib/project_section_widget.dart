import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  void launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget projectCard(String title, String desc, String url) {
    return MouseRegion(
      cursor: url.isNotEmpty ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: url.isNotEmpty ? () => launchURL(url) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(desc, style: const TextStyle(fontSize: 14, color: Colors.black87)),
              const SizedBox(height: 16),
              if (url.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    onPressed: () => launchURL(url),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text("View"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Top Projects",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            projectCard(
              "Zyapaar",
              "B2B Marketplace with Feed, CRM, Chat, Reels",
              "https://play.google.com/store/apps/details?id=com.zyapaar.mobile",
            ),
            projectCard(
              "PWSSB Staff App",
              "Government app for water staff with PDF/Excel reports",
              "https://play.google.com/store/apps/details?id=com.app.pwssb",
            ),
            projectCard(
              "SkyStock",
              "Stock trading app with live WebSocket pricing",
              "",
            ),
            projectCard(
              "Free Fantasy",
              "Fantasy cricket with referral and real-time matches",
              "https://play.google.com/store/apps/details?id=com.xr.freefantasy",
            ),
            projectCard(
              "Avikka",
              "Cosmetics eCommerce with Firebase backend",
              "https://play.google.com/store/apps/details?id=com.bw.avikka",
            ),
          ],
        ),
      ],
    );
  }
}

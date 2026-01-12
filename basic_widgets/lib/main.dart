import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widgets'),
        ),
        body: Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding:EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('lib/assets/image_assets/Documents_pic.jpg'),
          ),
            SizedBox(height: 10),
            Text(
              'AYOOB RASHEED',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Flutter Developer(hardly)| Systems Engineer(almost)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 15),
            SocialRow(),
          ],
        ),
      );
  }
}

class SocialRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/ayoob_rasheed3/'),
          const SizedBox(width: 24),
          buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/Mr-Ayoob-Rasheed'),
          const SizedBox(width: 24),
          buildSocialIcon(FontAwesomeIcons.whatsapp, 'https://wa.me/+923709013067'),
          const SizedBox(width: 24),
          buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/ayoob-rasheed-36b246297/'),
          const SizedBox(width: 24),
            ],
          );
}

Widget buildSocialIcon(IconData icon, String url) {
  bool isHovered = false;
  return StatefulBuilder(
    builder: (context, setState) {
      return MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedScale(
          scale: isHovered? 1.2 : 1.0,
          duration: Duration(milliseconds: 160),
          curve: Curves.easeOut,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: isHovered
                  ? [BoxShadow(blurRadius: 20, color: Colors.blue.withOpacity(0.3))]
                  : [],
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey.shade200,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Icon(icon, size: 30),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

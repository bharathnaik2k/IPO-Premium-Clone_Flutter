import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../export_port.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 510,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Hello, +919887766554"),
                      const Text(
                        "+919887766554", //intigert here api data
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      navRouteWidgets(
                          Icons.account_circle_outlined, "Edit Profile"),
                      navRouteWidgets(Icons.support_agent_outlined, "Support"),
                      navRouteWidgets(
                          Icons.contact_support_outlined, "About Us"),
                      navRouteWidgets(Icons.share, "Share App"),
                      navRouteWidgets(
                          CupertinoIcons.doc_text, "Term And Conditions"),
                      navRouteWidgets(
                          Icons.logout, "Log Out", Colors.red, Colors.red),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialMediaButton(const Color(0xFF25D366),
                        SvgPicture.asset("assets/svg_image/instagram.svg")),
                    socialMediaButton(const Color(0xFF1878F3),
                        SvgPicture.asset("assets/svg_image/youtube.svg")),
                    socialMediaButton(const Color(0xFF209FE1),
                        SvgPicture.asset("assets/svg_image/telegram.svg")),
                    socialMediaButton(const Color(0xFFD2419E),
                        SvgPicture.asset("assets/svg_image/facebook.svg")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container socialMediaButton(Color color, SvgPicture svgimage) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: svgimage,
    );
  }

  Column navRouteWidgets(IconData icon, String text,
      [Color iconcolor = Colors.black, textcolor = Colors.black]) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            Icon(icon, color: iconcolor),
            const SizedBox(width: 6),
            Text(text, style: TextStyle(fontSize: 16, color: textcolor)),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
      ],
    );
  }
}

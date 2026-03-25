import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFF6C8EBF),
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF6C8EBF),
              child: Icon(Icons.person,
                  size: 50, color: Colors.white),
            ),

            const SizedBox(height: 15),

            Text(
              "Clementine Agre",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "5 Credits Available",
              style: GoogleFonts.montserrat(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            profileOption(Icons.settings, "Settings"),
            profileOption(Icons.history, "Session History"),
            profileOption(Icons.logout, "Logout"),
          ],
        ),
      ),
    );
  }

  Widget profileOption(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1B263B)),
          const SizedBox(width: 15),
          Text(
            text,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


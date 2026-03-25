import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestLearningScreen extends StatelessWidget {
  const RequestLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFF6C8EBF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Request Learning",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// OFFERING CREDITS CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEF5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time,
                      color: Colors.orange),
                  const SizedBox(width: 12),
                  Text(
                    "Offering 5 credits",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            sectionTitle("Learning Dates"),
            const SizedBox(height: 15),

            segmentedTabs(),

            const SizedBox(height: 20),

            availabilityCard(),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.add,
                    size: 18,
                    color: Color(0xFF6C8EBF)),
                const SizedBox(width: 8),
                Text(
                  "Request another slot",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: const Color(0xFF6C8EBF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            sectionTitle("Skills To Learn"),
            const SizedBox(height: 15),

            skillChips([
              "Public Speaking",
              "Musical Instrument",
              "Web Design",
            ]),

            const SizedBox(height: 30),

            sectionTitle("Additional Details"),
            const SizedBox(height: 12),

            textFieldBox("Add details..."),

            const SizedBox(height: 50),

            publishButton("Publish Request"),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget segmentedTabs() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          tabItem("Today", true),
          tabItem("Tomorrow", false),
          tabItem("Custom Date", false),
        ],
      ),
    );
  }

  Widget tabItem(String text, bool selected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF1B263B)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: selected
                  ? Colors.white
                  : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget availabilityCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 18),
              SizedBox(width: 10),
              Text("Thu, Jul 11"),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time, size: 18),
              SizedBox(width: 10),
              Text("3:00 PM - 4:00 PM"),
            ],
          ),
        ],
      ),
    );
  }

  Widget skillChips(List<String> skills) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: skills
          .map(
            (skill) => Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1B263B),
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Text(
                skill,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget textFieldBox(String hint) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
      ),
      child: Text(
        hint,
        style: GoogleFonts.montserrat(
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget publishButton(String text) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE55C5C),
            Color(0xFFD64040)
          ],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

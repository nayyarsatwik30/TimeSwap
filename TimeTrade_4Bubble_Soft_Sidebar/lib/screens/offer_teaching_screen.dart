import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferTeachingScreen extends StatelessWidget {
  const OfferTeachingScreen({super.key});

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
          "Offer Teaching",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitle("Price"),
            const SizedBox(height: 10),
            creditSelector(),

            const SizedBox(height: 25),
            sectionTitle("Availability"),
            const SizedBox(height: 12),
            segmentedTabs(),

            const SizedBox(height: 15),
            availabilityCard(),

            const SizedBox(height: 25),
            sectionTitle("Skills To Teach"),
            const SizedBox(height: 12),
            skillChips([
              "Web Development",
              "Python",
              "Public Speaking"
            ]),

            const SizedBox(height: 25),
            sectionTitle("Additional Options"),
            const SizedBox(height: 10),
            textFieldBox("Add details..."),

            const SizedBox(height: 40),
            publishButton("Publish Availability"),
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

  Widget creditSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Credits"),
          Row(
            children: const [
              CircleAvatar(radius: 16, child: Icon(Icons.remove, size: 16)),
              SizedBox(width: 15),
              Text("2"),
              SizedBox(width: 15),
              CircleAvatar(radius: 16, child: Icon(Icons.add, size: 16)),
            ],
          )
        ],
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1B263B) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: selected ? Colors.white : Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget availabilityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 18),
              SizedBox(width: 10),
              Text("Thu, Jul 11"),
            ],
          ),
          SizedBox(height: 8),
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
          .map((skill) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B263B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  skill,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 12),
                ),
              ))
          .toList(),
    );
  }

  Widget textFieldBox(String hint) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        hint,
        style: GoogleFonts.montserrat(color: Colors.black38),
      ),
    );
  }

  Widget publishButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFFE55C5C), Color(0xFFD64040)],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

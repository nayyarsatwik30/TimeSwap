import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'offer_teaching_screen.dart';
import 'request_learning_screen.dart';
import 'search_screen.dart';
import 'texts_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<Widget> _screens = [
    _buildHomeContent(),
    const SearchScreen(),
    const TextsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF6C8EBF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  // ✅ HOME CONTENT PROPERLY OUTSIDE BUILD
  Widget _buildHomeContent() {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppSidebar(),
      backgroundColor: const Color(0xFFF4F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// TOP HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF6C8EBF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: const Icon(Icons.menu, color: Colors.white),
                        ),
                        const Icon(Icons.notifications_none,
                            color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Hello,\nClementine",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Teach to earn time credits and\nuse it to learn skills",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: heroButton(
                            context: context,
                            text: "Offer teaching",
                            bgColor: const Color(0xFF1B263B),
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: heroButton(
                            context: context,
                            text: "Request learning",
                            bgColor: Colors.white,
                            textColor: const Color(0xFF1B263B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              sectionTitle("Skill Matches"),
              const SizedBox(height: 15),
              skillMatchCard(),

              const SizedBox(height: 25),

              sectionHeader(
                title: "Categories",
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF6C8EBF),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryCard("Web Development", Icons.code),
                  categoryCard("Music", Icons.music_note),
                ],
              ),

              const SizedBox(height: 25),

              sectionHeader(
                title: "Upcoming sessions",
                trailing: Text(
                  "View All",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6C8EBF),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              sessionCard("Yoga", "10:00 AM"),
              sessionCard("Book Writing", "2:00 PM"),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ----------- UI COMPONENTS -----------

  Widget sectionHeader({required String title, required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w600)),
          trailing,
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget heroButton({
    required BuildContext context,
    required String text,
    required Color bgColor,
    required Color textColor,
  }) {
    return GestureDetector(
      onTap: () {
        if (text == "Offer teaching") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OfferTeachingScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const RequestLearningScreen(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget skillMatchCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1B263B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cepheus Brown",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text("Public speaking | 5 credits",
                      style: GoogleFonts.montserrat(
                          color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(String title, IconData icon) {
    return Container(
      width: 150,
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFF1B263B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(title,
              style:
                  GoogleFonts.montserrat(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget sessionCard(String title, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1B263B),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: GoogleFonts.montserrat(color: Colors.white)),
            Text(time,
                style: GoogleFonts.montserrat(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}


class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          const Color(0xFF1B263B),
      child: Column(
        children: [

          const SizedBox(height: 60),

          const CircleAvatar(
            radius: 40,
            backgroundColor:
                Color(0xFF2F4756),
            child:
                Icon(Icons.person, size: 40),
          ),

          const SizedBox(height: 15),

          Text(
            "Clementine Agre",
            style:
                GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight:
                  FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 30),

          drawerItem(context,
              Icons.dashboard, "Dashboard"),
          drawerItem(context,
              Icons.swap_horiz, "Requests"),
          drawerItem(context,
              Icons.local_offer, "Offers"),
          drawerItem(context,
              Icons.schedule, "Scheduler"),
          drawerItem(context,
              Icons.star_border, "My Skills"),
          drawerItem(context,
              Icons.notifications_none,
              "Notifications"),
          drawerItem(context,
              Icons.settings, "Settings"),
          drawerItem(context,
              Icons.help_outline, "Help"),

          const Spacer(),

          drawerItem(context,
              Icons.logout, "Logout",
              isLogout: true),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout
            ? Colors.redAccent
            : Colors.white,
      ),
      title: Text(
        title,
        style:
            GoogleFonts.montserrat(
          color: isLogout
              ? Colors.redAccent
              : Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context);

        if (title == "Logout") {
          // Add logout navigation here
        }
      },
    );
  }
}

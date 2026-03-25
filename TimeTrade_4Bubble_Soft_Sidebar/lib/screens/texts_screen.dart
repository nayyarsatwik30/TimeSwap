import 'package:flutter/material.dart';

class TextsScreen extends StatelessWidget {
  const TextsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Texts"),
        backgroundColor: const Color(0xFF6C8EBF),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(),
            title: Text("Alice Whitmore"),
            subtitle: Text("Sounds good!"),
            trailing: Text("1 hr ago"),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Jack Turner"),
            subtitle: Text("Got it!"),
            trailing: Text("Yesterday"),
          ),
        ],
      ),
    );
  }
}

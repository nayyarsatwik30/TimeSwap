import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'widgets/auth_gate.dart';          // ← import AuthGate

final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ftigsovirdrpaejnugqq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0aWdzb3ZpcmRycGFlam51Z3FxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI5ODk5NTksImV4cCI6MjA4ODU2NTk1OX0.Fgz0g7TzJ30fTv-TLvHEs2ur4Ez3TkeL-uqi0BnAqAU',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimeSwap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C8EBF)),
        useMaterial3: true,
      ),
      home: const AuthGate(),   // ← replaces whatever was here before
    );
  }
}
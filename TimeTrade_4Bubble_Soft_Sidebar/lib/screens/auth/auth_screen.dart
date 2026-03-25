import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = true; // 👈 Starts with Sign Up first

  void toggle() {
    setState(() {
      isSignUp = !isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8DCCB),
      body: Stack(
        children: [

          /// ⭐ HEADER IMAGE
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/images/auth_header_graph.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          /// ⭐ ANIMATED CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: isSignUp
                  ? MediaQuery.of(context).size.height * 0.72
                  : MediaQuery.of(context).size.height * 0.65,
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
              decoration: const BoxDecoration(
                color: Color(0xFF1C1B3A),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    isSignUp ? "Create Account" : "Welcome Back!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// EMAIL
                  _inputField("Email"),

                  const SizedBox(height: 18),

                  /// PASSWORD
                  _inputField("Password", obscure: true),

                  const SizedBox(height: 18),

                  /// EXTRA FIELD ONLY FOR SIGN UP
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isSignUp
                        ? Column(
                            key: const ValueKey("signup"),
                            children: [
                              _inputField("Confirm Password",
                                  obscure: true),
                              const SizedBox(height: 18),
                            ],
                          )
                        : const SizedBox(key: ValueKey("empty")),
                  ),

                  const SizedBox(height: 10),

                  /// BUTTON
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print(isSignUp ? "Sign Up Clicked" : "Sign In Clicked");
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
      (route) => false,
    );
  

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4AF37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          isSignUp ? "Sign Up" : "Sign In",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// TOGGLE TEXT
                  Center(
                    child: GestureDetector(
                      onTap: toggle,
                      child: Text(
                        isSignUp
                            ? "Already have an account? Sign In"
                            : "Don't have an account? Sign Up",
                        style: const TextStyle(
                          color: Colors.white70,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
            Padding(
  padding: const EdgeInsets.only(left: 170),
  child: Text(
    'or',
    style: const TextStyle(color: Colors.white70),
  ),
),
                 SizedBox(height: 14),

                  /// SOCIAL ICONS
                  Center(
                    child: Image.asset(
                      "assets/images/social_icons.png",
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.08),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

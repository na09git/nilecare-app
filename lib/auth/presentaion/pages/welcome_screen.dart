import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3EEF7),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          ),
          child: Column(
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                  fontFamily: GoogleFonts.imperialScript().fontFamily,
                  fontSize: 50,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(
                  'assets/logo/nilecare.jpg',
                  height: 250,
                  
                ),
              ),
              SizedBox(height: 70),
              Text(
                'Your Health, our Priority',
                style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
              SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 _buildButton('Login', '/signin', Colors.blueAccent),
                 SizedBox(width: 16),
                 _buildButton('Sign up', '/signup', Colors.lightBlue),
                ]
              )
              
              
            ],
          ),
        ),
      ),
    );
  }


 // custom button
 Widget _buildButton(String text, String route,Color color) {
   return TextButton(
    onPressed: () {
      context.go(route);
    },
    style: ButtonStyle(
      fixedSize: WidgetStatePropertyAll(Size(100,50)),
      backgroundColor: WidgetStatePropertyAll(color),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(12),
       )),
    ),
    child: Text(
      text,
      style: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.1,
      ),
    ),
   );
 }
}

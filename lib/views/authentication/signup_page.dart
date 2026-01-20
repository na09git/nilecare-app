import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilecare/views/authentication/widget/textfield.dart';
import 'package:nilecare/views/common_ui_widgets/primary_button.dart';
import 'package:nilecare/views/common_ui_widgets/social_media.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // active keyboard pixel error fix
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                width: 200,
                height: 50,
                child: Image.asset('assets/starter/nilecare_nobg.png',fit: BoxFit.cover,),
              ),
              const SizedBox(height: 20),
              Text(
                'Create Account',
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Join NileCare and take control of your healthcare journey',
                style: GoogleFonts.outfit(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              AppTextField(labelText: 'Enter your full name'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Enter your email'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Enter yourphone number'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Create strong password'),
              const SizedBox(height: 40),
              PrimaryButton(label: 'Create Account'),
              const SizedBox(height: 20),
              // line
              const Divider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.facebook,
                    backgroundColor: const Color(0xFF4267B2),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: Icons.telegram,
                    backgroundColor: const Color(0xFF4267B2),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: Icons.apple,
                    backgroundColor: const Color(0xFF4267B2),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color(0xFF2E7CF6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

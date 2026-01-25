import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilecare/views/authentication/widget/textfield.dart';
import 'package:nilecare/views/common_ui_widgets/primary_button.dart';
import 'package:nilecare/views/common_ui_widgets/social_media.dart';

import 'package:nilecare/utils/constants/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                    ),
                  ],
                ),
                width: 100,
                height: 40,
                child: Image.asset(
                  'assets/logo/nilecare_nobg.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Create Account',
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColor.dark.text,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Join NileCare and take control of your healthcare journey',
                style: GoogleFonts.outfit(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Enter your full name'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Enter your email'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Enter yourphone number'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Create strong password'),
              const SizedBox(height: 40),
              PrimaryButton(
                label: 'Create Account',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? ",style: TextStyle(color: AppColor.dark.text),),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
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

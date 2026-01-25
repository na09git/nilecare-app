import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilecare/views/authentication/widget/textfield.dart';
import 'package:nilecare/views/common_ui_widgets/primary_button.dart';

import 'package:nilecare/utils/constants/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                      blurRadius: 2,
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
                'Welcome Back',
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColor.dark.text,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to access your healthcare account',
                style: GoogleFonts.outfit(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              AppTextField(labelText: 'Enter your email'),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Password'),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => context.push('/forgot-password'),
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Color(0xFF2E7CF6)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                label: 'Sign in',
                onPressed: () {
                  context.go('/home');
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: TextStyle(color: AppColor.dark.text),),
                  GestureDetector(
                    onTap: () => context.push('/signup'),
                    child: const Text(
                      'Create Account',
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

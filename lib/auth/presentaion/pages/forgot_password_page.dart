import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilecare/widgets/app_textfield.dart';

import 'package:nilecare/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1528),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              _buildStepIndicator(),
              const SizedBox(height: 60),

              Expanded(
                child: SingleChildScrollView(child: _buildStepContent()),
              ),
             
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton.icon(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF2E7CF6),
                    size: 18,
                  ),
                  label: Text(
                    'Back to Sign In',
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF2E7CF6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _indicatorItem(1, 'Enter your email', _currentStep >= 0),
        _indicatorLine(_currentStep >= 1),
        _indicatorItem(2, 'Verify OTP', _currentStep >= 1),
        _indicatorLine(_currentStep >= 2),
        _indicatorItem(3, 'New Password', _currentStep >= 2),
      ],
    );
  }

  Widget _indicatorItem(int step, String label, bool isActive) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2E7CF6) : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Colors.transparent : Colors.grey,
            ),
          ),
          child: Center(
            child: Text(
              step.toString(),
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label.split(' ').join('\n'), 
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            fontSize: 10,
            color: isActive ? Colors.white70 : Colors.white38,
          ),
        ),
      ],
    );
  }

  Widget _indicatorLine(bool isActive) {
    return Container(
      width: 40,
      height: 2,
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
      color: isActive ? const Color(0xFF2E7CF6) : Colors.white38,
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _stepEmail();
      case 1:

        return _stepOTP();

      case 2:
        return _stepNewPassword();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _stepEmail() {
    return Column(
      children: [
        const Icon(Icons.vpn_key_outlined, size: 64, color: Color(0xFF2E7CF6)),
        const SizedBox(height: 24),
        Text(
          'Reset Password',
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Enter your email address and we\'ll send you instructions to reset your password',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email Address',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const AppTextField(
          labelText: 'Enter your email address',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 40),
        PrimaryButton(label: 'Send Reset Code', onPressed: _nextStep),
      ],
    );
  }

  Widget _stepOTP() {
    return Column(
      children: [
        const Icon(
          Icons.mark_email_read_outlined,
          size: 64,
          color: Color(0xFF2E7CF6),
        ),
        const SizedBox(height: 24),
        Text(
          'Verify OTP',
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'We have sent a verification code to your email. Please enter it below.',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 40),
        const AppTextField(
          labelText: 'Enter verification code',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 40),
        PrimaryButton(label: 'Verify Code', onPressed: _nextStep),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Text(
            'Resend Code',
            style: GoogleFonts.outfit(color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _stepNewPassword() {
    return Column(
      children: [
        const Icon(
          
          Icons.lock_reset_outlined,
          size: 64,
          color: Color(0xFF2E7CF6),
        ),
        const SizedBox(height: 24),
        Text(
          'New Password',
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Set a new, strong password for your account to finish the recovery.',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 40),
        const AppTextField(labelText: 'Create new password', obscureText: true),
        const SizedBox(height: 20),
        const AppTextField(
          labelText: 'Confirm new password',
          obscureText: true,
        ),
        const SizedBox(height: 40),
        PrimaryButton(label: 'Reset Password', onPressed: _nextStep),
      ],
    );
  }
}

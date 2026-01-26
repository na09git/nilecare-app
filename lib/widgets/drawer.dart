import 'package:flutter/material.dart';
import 'package:nilecare/auth/core/constant/colors.dart';

class AppDrawer extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final Function(String route) onNavigate;

  const AppDrawer({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode
        ? AppColor.dark.secondary
        : AppColor.light.background;

    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Custom header
          _CustomDrawerHeader(
            isDarkMode: isDarkMode,
            onToggleTheme: onToggleTheme,
          ),

          // Drawer items
        ],
      ),
    );
  }
}

class _CustomDrawerHeader extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const _CustomDrawerHeader({
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            right: 20,
            bottom: 5,
          ),
          decoration: BoxDecoration(
            color: isDarkMode
                ? AppColor.dark.secondary
                : AppColor.light.themeColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 45, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Text(
                "Patient Name",
                style: TextStyle(
                  color: isDarkMode ? AppColor.dark.text : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: isDarkMode ? AppColor.dark.text : Colors.white,
                ),
                onPressed: onToggleTheme,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

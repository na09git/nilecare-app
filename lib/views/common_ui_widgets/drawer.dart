import 'package:flutter/material.dart';
import 'package:nilecare/utils/constants/colors.dart';

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
    final textColor = isDarkMode ? AppColor.dark.text : AppColor.light.text;
    final iconColor = isDarkMode ? AppColor.dark.text : AppColor.light.text;

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
          _item(
            Icons.person_outline,
            "Profile",
            "/profile",
            textColor,
            iconColor,
          ),
          _item(
            Icons.calendar_today_outlined,
            "My Appointments",
            "/appointments",
            textColor,
            iconColor,
          ),
          _item(Icons.inbox_outlined, "Inbox", "/inbox", textColor, iconColor),
          _item(
            Icons.video_library_outlined,
            "Videos",
            "/doctor-videos",
            textColor,
            iconColor,
          ),

          Divider(
            color: isDarkMode ? AppColor.dark.border : AppColor.light.border,
          ),

          _item(Icons.logout, "Logout", "/logout", textColor, iconColor),
        ],
      ),
    );
  }

  Widget _item(
    IconData icon,
    String title,
    String route,
    Color textColor,
    Color iconColor,
  ) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
      onTap: () => onNavigate(route),
    );
  }
}

// ---------------- Custom Drawer Header ----------------
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

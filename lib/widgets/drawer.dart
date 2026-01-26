import 'package:flutter/material.dart';

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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Custom header
          _CustomDrawerHeader(
            isDarkMode: isDarkMode,
            onToggleTheme: onToggleTheme,
          ),

          // Drawer items
          _item(Icons.person_outline, "Profile", "/profile"),
          _item(
            Icons.calendar_today_outlined,
            "My Appointments",
            "/appointments",
          ),
          _item(Icons.folder_open_outlined, "Medical Records", "/records"),
          _item(Icons.favorite_border, "Saved Doctors", "/saved-doctors"),
          _item(Icons.payment_outlined, "Payments & Billing", "/payments"),

          const Divider(),

          _item(Icons.help_outline, "Help & Support", "/support"),
          _item(Icons.lock_outline, "Privacy & Security", "/privacy"),
          _item(Icons.language_outlined, "Language", "/language"),

          const Divider(),
          
          _item(Icons.info_outline, "About", "/about"),
          _item(Icons.logout, "Logout", "/logout"),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
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
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      Positioned(
        top: 20,
        right: 20,
        child: IconButton(
          icon: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Colors.white,
          ),
          onPressed: onToggleTheme,
          tooltip: "Toggle Theme",
        ),
      ),
      ]
    );
  }
}

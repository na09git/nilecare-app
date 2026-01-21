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
          _item(Icons.payment_outlined, "Payments & Billing", "/payments"),
          _item(Icons.inbox_outlined, "Inbox", "/inbox"),
          _item(
            Icons.video_library_outlined,
            "Doctor Videos",
            "/doctor-videos",
          ),
          _item(Icons.monetization_on_outlined, "Sales & Analytics", "/sales"),

          const Divider(),

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
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Positioned(top: 20, right: 20, child: ThemeModeSelector()),
      ],
    );
  }
}

// ---------------- Theme Mode Selector ----------------
enum ThemeMode { light, dark, system }

class ThemeModeSelector extends StatefulWidget {
  const ThemeModeSelector({super.key});

  @override
  State<ThemeModeSelector> createState() => _ThemeModeSelectorState();
}

class _ThemeModeSelectorState extends State<ThemeModeSelector> {
  ThemeMode _selectedMode = ThemeMode.system;

  void _showThemeSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose Theme',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _ThemeOption(
                    icon: Icons.light_mode,
                    title: 'Light',
                    subtitle: 'Light theme',
                    isSelected: _selectedMode == ThemeMode.light,
                    onTap: () {
                      setState(() {
                        _selectedMode = ThemeMode.light;
                      });
                      setModalState(() {});
                    },
                  ),
                  const SizedBox(height: 12),
                  _ThemeOption(
                    icon: Icons.dark_mode,
                    title: 'Dark',
                    subtitle: 'Dark theme',
                    isSelected: _selectedMode == ThemeMode.dark,
                    onTap: () {
                      setState(() {
                        _selectedMode = ThemeMode.dark;
                      });
                      setModalState(() {});
                    },
                  ),
                  const SizedBox(height: 12),
                  _ThemeOption(
                    icon: Icons.brightness_auto,
                    title: 'System',
                    subtitle: 'Follow system settings',
                    isSelected: _selectedMode == ThemeMode.system,
                    onTap: () {
                      setState(() {
                        _selectedMode = ThemeMode.system;
                      });
                      setModalState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  IconData get _currentIcon {
    switch (_selectedMode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_currentIcon, color: Colors.white),
      onPressed: () => _showThemeSelector(context),
      tooltip: "Change Theme",
    );
  }
}

// ---------------- Theme Option Widget ----------------
class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

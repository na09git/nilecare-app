import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nilecare/utils/constants/colors.dart';
import 'package:nilecare/views/common_ui_widgets/drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DoctorMainScreens extends StatefulWidget {
  const DoctorMainScreens({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<DoctorMainScreens> createState() => _DoctorMainScreensState();
}

class _DoctorMainScreensState extends State<DoctorMainScreens> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColor.dark.background
          : AppColor.light.background,
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColor.dark.background
            : AppColor.light.background,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
        onNavigate: (route) {
          context.pop();
          context.push(route);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Appointments"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.schedule),
            title: Text("Schedule"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.people),
            title: Text("Patients"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

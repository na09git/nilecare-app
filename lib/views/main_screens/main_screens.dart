import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nilecare/core/constants/colors.dart';
import 'package:nilecare/widgets/drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
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
            icon: Icon(Icons.person_2),
            title: Text("Doctors"),
            selectedColor: Colors.pink,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.medical_services),
            title: Text("Services"),
            selectedColor: Colors.orange,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.schedule),
            title: Text("Activity"),
            selectedColor: Colors.pink,
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

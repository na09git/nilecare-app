import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nilecare/utils/constants/colors.dart';
import 'package:nilecare/views/common_ui_widgets/drawer.dart';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  bool isDarkMode = true;
  final _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    _controller.index = index;
  }

  @override
  Widget build(BuildContext context) {
    // Ensure controller is synced with current index from GoRouter
    if (_controller.index != widget.navigationShell.currentIndex) {
      _controller.index = widget.navigationShell.currentIndex;
    }

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
            icon: Icon(
              Icons.menu,
              color: isDarkMode ? AppColor.dark.text : AppColor.light.text,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: isDarkMode ? AppColor.dark.text : AppColor.light.text,
              ),
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
        child: const Icon(Icons.add),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: isDarkMode ? AppColor.dark.secondary : AppColor.light.background,
        showLabel: true,
        notchColor: isDarkMode
            ? AppColor.dark.secondary
            : AppColor.light.background,
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home, color: Colors.blueGrey),
            activeItem: Icon(Icons.home, color: Colors.purple),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_2, color: Colors.blueGrey),
            activeItem: Icon(Icons.person_2, color: Colors.pink),
            itemLabel: 'Doctors',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.medical_services, color: Colors.blueGrey),
            activeItem: Icon(Icons.medical_services, color: Colors.orange),
            itemLabel: 'Services',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.inbox, color: Colors.blueGrey),
            activeItem: Icon(Icons.inbox, color: Colors.pink),
            itemLabel: 'Inbox',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person, color: Colors.blueGrey),
            activeItem: Icon(Icons.person, color: Colors.teal),
            itemLabel: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
        kIconSize: 24.0,
        kBottomRadius: 28.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:nilecare/auth/core/constant/colors.dart';
import 'package:nilecare/widgets/drawer.dart';

class DoctorMainScreens extends StatefulWidget {
  const DoctorMainScreens({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<DoctorMainScreens> createState() => _DoctorMainScreensState();
}

class _DoctorMainScreensState extends State<DoctorMainScreens> {
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
            inActiveItem: Icon(Icons.calendar_today, color: Colors.blueGrey),
            activeItem: Icon(Icons.calendar_today, color: Colors.pink),
            itemLabel: 'Appointments',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.schedule, color: Colors.blueGrey),
            activeItem: Icon(Icons.schedule, color: Colors.orange),
            itemLabel: 'Schedule',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.people, color: Colors.blueGrey),
            activeItem: Icon(Icons.people, color: Colors.blue),
            itemLabel: 'Patients',
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

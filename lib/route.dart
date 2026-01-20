import 'package:go_router/go_router.dart';
import 'package:nilecare/views/authentication/forgot_password_page.dart';
import 'package:nilecare/views/authentication/signin_page.dart';
import 'package:nilecare/views/authentication/signup_page.dart';
import 'package:nilecare/views/main_screens/home_page.dart';
import 'package:nilecare/views/main_screens/activity_page.dart';
import 'package:nilecare/views/main_screens/doctors_page.dart';
import 'package:nilecare/views/main_screens/main_screens.dart';
import 'package:nilecare/views/main_screens/services_page.dart';
import 'package:nilecare/views/main_screens/profile_page.dart';
import 'package:nilecare/views/onboarding/onboarding.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Onboarding()),
      GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreens(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctors',
                builder: (context, state) => const DoctorsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/services',
                builder: (context, state) => const ServicesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/activities',
                builder: (context, state) => const ActivityPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

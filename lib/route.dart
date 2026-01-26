import 'package:go_router/go_router.dart';

// drawer screens
import 'package:nilecare/views/drawer_screens/appointments_page.dart';
import 'package:nilecare/views/drawer_screens/payments_page.dart';

// autnetication pages
import 'package:nilecare/views/authentication/forgot_password_page.dart';
import 'package:nilecare/views/authentication/signin_page.dart';
import 'package:nilecare/views/authentication/signup_page.dart';
import 'package:nilecare/views/authentication/verify_email_page.dart';
import 'package:nilecare/views/welcome/welcome_screen.dart';

// system screens
import 'package:nilecare/views/system_screens/doctor_videos_page.dart';
import 'package:nilecare/views/system_screens/sales_page.dart';
import 'package:nilecare/views/system_screens/doctor_datail.dart';
import 'package:nilecare/views/system_screens/symptoms_page.dart';
import 'package:nilecare/views/system_screens/specialities_page.dart';

// patients page
import 'package:nilecare/views/main_screens/patient/home_page.dart';
import 'package:nilecare/views/main_screens/patient/doctors_page.dart';
import 'package:nilecare/views/main_screens/patient_main_screens.dart';
import 'package:nilecare/views/main_screens/patient/services_page.dart';
import 'package:nilecare/views/main_screens/patient/profile_page.dart';
import 'package:nilecare/views/main_screens/patient/inbox_page.dart';

// Doctor screens
import 'package:nilecare/views/main_screens/doctor/home_page.dart' as doctor;
import 'package:nilecare/views/main_screens/doctor/appointments_page.dart';
import 'package:nilecare/views/main_screens/doctor/schedule_page.dart';
import 'package:nilecare/views/main_screens/doctor/patients_page.dart';
import 'package:nilecare/views/main_screens/doctor/profile_page.dart'
    as doctor_profile;
import 'package:nilecare/views/main_screens/doctor_main_screens.dart';

// Admin screens
import 'package:nilecare/views/main_screens/admin/admin_home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
      GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/verify-email',
        builder: (context, state) => const VerifyEmailPage(),
      ),

      // Drawer navigation routes
      GoRoute(
        path: '/appointments',
        builder: (context, state) => const AppointmentsPage(),
      ),
      GoRoute(
        path: '/payments',
        builder: (context, state) => const PaymentsPage(),
      ),
      GoRoute(
        path: '/inbox',
        builder: (context, state) => const PatientInboxPage(),
      ),
      GoRoute(
        path: '/doctor-videos',
        builder: (context, state) => const DoctorVideosPage(),
      ),
      GoRoute(path: '/sales', builder: (context, state) => const SalesPage()),
      GoRoute(
        path: '/doctor-detail',
        builder: (context, state) => const DoctorDetail(),
      ),
      GoRoute(
        path: '/symptoms',
        builder: (context, state) => const SymptomsPage(),
      ),
      GoRoute(
        path: '/specialities',
        builder: (context, state) => const SpecialitiesPage(),
      ),
      GoRoute(path: '/logout', builder: (context, state) => const SignInPage()),

      // Main app shell with bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreens(navigationShell: navigationShell);
        },
        branches: [
          // Home tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // Doctors tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctors',
                builder: (context, state) => const DoctorsPage(),
              ),
            ],
          ),
          // Services tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/services',
                builder: (context, state) => const ServicesPage(),
              ),
            ],
          ),
          // Inbox tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/inbox-tab',
                builder: (context, state) => const PatientInboxPage(),
              ),
            ],
          ),
          // Profile/Settings tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // Admin route - single screen
      GoRoute(
        path: '/admin-home',
        builder: (context, state) => const AdminHomePage(),
      ),

      // Doctor app shell with bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DoctorMainScreens(navigationShell: navigationShell);
        },
        branches: [
          // Doctor Home tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctor-home',
                builder: (context, state) => const doctor.DoctorHomePage(),
              ),
            ],
          ),
          // Doctor Appointments tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctor-appointments',
                builder: (context, state) => const DoctorAppointmentsPage(),
              ),
            ],
          ),
          // Doctor Schedule tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctor-schedule',
                builder: (context, state) => const DoctorSchedulePage(),
              ),
            ],
          ),
          // Doctor Patients tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctor-patients',
                builder: (context, state) => const DoctorPatientsPage(),
              ),
            ],
          ),
          // Doctor Profile tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/doctor-profile',
                builder: (context, state) =>
                    const doctor_profile.DoctorProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

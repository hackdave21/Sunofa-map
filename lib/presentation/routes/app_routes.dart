import 'package:flutter/material.dart';
import 'package:sunofa_map/presentation/views/app_screens/add_map_form_screen.dart';
import 'package:sunofa_map/presentation/views/app_screens/dashboard_screen.dart';
import 'package:sunofa_map/presentation/views/auth/login_screen.dart';
import 'package:sunofa_map/presentation/views/auth/register_screen.dart';
import 'package:sunofa_map/presentation/views/onboarding/onboarding_screen.dart';


class Routes {
  static const String home = '/';
  static const String loginScreen = '/Loginscreen';
  static const String registerScreen = '/Registerscreen';
   static const String dashboardScreen = '/Dashboardscreen';
    static const String addMapFormScreen = '/AddMapFormScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case registerScreen:
        return MaterialPageRoute(
            builder: (context) => const RegisterScreen());
             case loginScreen:
        return MaterialPageRoute(
            builder: (context) =>  LoginScreen());
              case dashboardScreen:
        return MaterialPageRoute(
            builder: (context) =>  DashboardScreen());
              case addMapFormScreen:
        return MaterialPageRoute(
            builder: (context) =>  AddMapFormScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Pas de routes défini ${settings.name}'),
            ),
          ),
        );
    }
  }
}

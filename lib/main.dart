import 'package:flutter/material.dart';
import 'package:biometric_app/login_screen.dart';
import 'package:biometric_app/home_screen.dart';

void main() {
  runApp(const BiometricApp());
}

class BiometricApp extends StatelessWidget {
  const BiometricApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF7F00FF),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF7F00FF),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}



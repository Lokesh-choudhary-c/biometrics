// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:biometric_app/auth_service.dart';
import 'package:biometric_app/storage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final SecureStorage _secureStorage = SecureStorage();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPasswordField = false;
  bool _isSettingPassword = false;

  String? _storedPassword;

  @override
  void initState() {
    super.initState();
    _loadStoredPassword();
  }

  Future<void> _loadStoredPassword() async {
    _storedPassword = await _secureStorage.readPassword();
    setState(() {
      _isSettingPassword = _storedPassword == null;
    });
  }

  void _authenticate() async {
    final success = await _authService.authenticate();
    if (success) {
      await _secureStorage.saveToken('secure_login_token');
      Navigator.pushNamed(context, '/home');
    } else {
      _showSnackbar("Authentication Failed");
    }
  }

  void _verifyOrSetPassword() async {
    final input = _passwordController.text.trim();

    if (input.isEmpty) {
      _showSnackbar("Password cannot be empty.");
      return;
    }

    if (_isSettingPassword) {
      await _secureStorage.savePassword(input);
      await _secureStorage.saveToken('password_set_token');
      _showSnackbar("Password set successfully.");
      setState(() {
        _isSettingPassword = false;
        _showPasswordField = false;
        _passwordController.clear();
      });
    } else {
      if (input == _storedPassword) {
        await _secureStorage.saveToken('fallback_token');
        Navigator.pushNamed(context, '/home');
      } else {
        _showSnackbar("Incorrect password.");
      }
    }
  }

  void _showSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.fingerprint, size: 64, color: Colors.white),
                ),
                const SizedBox(height: 24),
                Text(
                  "Unlock with Touch",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Place your finger on the sensor",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F00FF),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _authenticate,
                  icon: const Icon(Icons.fingerprint, color: Colors.white),
                  label: const Text(
                    "Use Biometrics",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () => setState(() => _showPasswordField = true),
                  child: Text(
                    _isSettingPassword ? "Set a password" : "Use password instead",
                    style: const TextStyle(color: Color(0xFF7F00FF)),
                  ),
                ),
                if (_showPasswordField) ...[
                  const SizedBox(height: 30),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: _isSettingPassword
                          ? "Create a password"
                          : "Enter your password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _verifyOrSetPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      _isSettingPassword ? "Set Password" : "Login",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

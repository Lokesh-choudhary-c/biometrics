import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("Home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color(0xFF7F00FF),
        elevation: 6,
        // ignore: deprecated_member_use
        shadowColor: Colors.deepPurple.withOpacity(0.4),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.white,),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
            tooltip: "Logout",
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.deepPurple.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, color: Colors.green, size: 60),
              SizedBox(height: 16),
              Text(
                "Login Successful",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "You are now inside the app",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


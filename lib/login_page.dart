import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String username;

  const LoginPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Exit the login page
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile icon placeholder
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 50),
                ),
              ),
              const SizedBox(height: 20),

              // Username display
              Center(
                child: Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Profile options
              const Text(
                'Profile Settings',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.white),
                title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.white),
                title: const Text('Change Password', style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),

              // Exit button at bottom
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Exit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
    return Column(
      children: [
        const Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              label: Text('Username'),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

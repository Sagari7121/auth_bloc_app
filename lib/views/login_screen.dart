import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/login_bloc.dart';
import 'package:login/blocs/login_event.dart';
import 'package:login/blocs/login_state.dart';
import 'package:login/models/user.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Center(
          child: Container(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    TextButton(
                      onPressed: () {
                        User user = User(
                            username: _usernameController.text,
                            password: _passwordController.text,
                            id: Uuid().v1());
                        if (state
                            .where((u) => u.username == user.username)
                            .isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('User already exists!'),
                              content: Text('Please try other username'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: Text('Okay'))
                              ],
                            ),
                          );
                        } else {
                          context.read<LoginBloc>().add(LoginRequest);
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

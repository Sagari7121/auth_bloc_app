import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/login_bloc.dart';
import 'package:login/blocs/login_event.dart';
import 'package:login/views/login_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 174, 193, 174))),
    home: BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginScreen(),
    ),
  ));
}

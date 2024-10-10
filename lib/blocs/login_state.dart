import 'package:login/models/auth.dart';
import 'package:login/models/user.dart';

class LoginState{
  const LoginState({this.status = Auth.unknown,required this.user});

  final Auth status;
  final User user;
}
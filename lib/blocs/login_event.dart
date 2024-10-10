import 'package:login/models/user.dart';

sealed class LoginEvent{}
final class LoginRequest extends LoginEvent{}
final class LogoutRequest extends LoginEvent{}

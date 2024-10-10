import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/login_state.dart';
import 'package:login/blocs/user_data.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(const LoginState(user: User())){
    on<LoginRequest>((event, emit) {
      LoginState(status: Auth.authenticated, user: User());
    },);
  }


}
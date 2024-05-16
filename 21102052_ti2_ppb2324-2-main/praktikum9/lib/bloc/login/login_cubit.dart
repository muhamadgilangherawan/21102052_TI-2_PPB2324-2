import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../repositories/auth_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _repo = AuthRepo();

  LoginCubit() : super(LoginInitial());

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(LoginSuccess('Login berhasil!'));
    } catch (e) {
      print(e);
      emit(LoginFailure(e.toString()));
    }
  }
}

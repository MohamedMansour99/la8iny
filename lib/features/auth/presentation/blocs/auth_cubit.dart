import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la8iny/features/auth/data/models/user_model.dart';
import 'package:la8iny/features/auth/presentation/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState());

  final AuthRepo _authRepo;

  Future<void> initialize() async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final user = await _authRepo.getUser();
      if (user != null) {
        emit(state.copyWith(status: UserStatus.loggedIn, user: () => user));
      } else {
        emit(state.copyWith(status: UserStatus.loggedOut));
      }
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final user = await _authRepo.login(email, password);
      emit(state.copyWith(status: UserStatus.loggedIn, user: () => user));
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final user = await _authRepo.signup(name, email, password);
      emit(state.copyWith(status: UserStatus.loggedIn, user: () => user));
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> logout() async {
    try {
      await _authRepo.logout();
      emit(state.copyWith(status: UserStatus.loggedOut, user: () => null));
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

}

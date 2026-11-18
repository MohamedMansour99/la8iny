part of 'auth_cubit.dart';

enum UserStatus { initial, loading, loggedIn, loggedOut, error }

extension UserStatusX on UserStatus {
  bool get isInitial => this == UserStatus.initial;
  bool get isLoading => this == UserStatus.loading;
  bool get isLoggedIn => this == UserStatus.loggedIn;
  bool get isLoggedOut => this == UserStatus.loggedOut;
  bool get isError => this == UserStatus.error;
}

@immutable
class AuthState {
  final UserStatus status;
  final User? user;
  final String? errorMessage;

  const AuthState({
    this.status = UserStatus.initial,
    this.user,
    this.errorMessage,
  });
  AuthState copyWith({
    UserStatus? status,
    ValueGetter<User?>? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user != null ? user() : this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'AuthState(status: $status, user: $user, errorMessage: $errorMessage)';

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.user == user &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => status.hashCode ^ user.hashCode ^ errorMessage.hashCode;
}

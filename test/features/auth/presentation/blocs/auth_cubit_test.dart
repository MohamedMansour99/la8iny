// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:la8iny/features/auth/data/models/user_model.dart';
// import 'package:la8iny/features/auth/presentation/blocs/auth_cubit.dart';
// import 'package:la8iny/features/auth/presentation/repo/auth_repo.dart';
// import 'package:mocktail/mocktail.dart';

// class MockAuthRepository extends Mock implements AuthRepo {}

// void main() {
//   late MockAuthRepository _authRepo;
//   late AuthCubit _authCubit;

//   setUp(() {
//     _authRepo = MockAuthRepository();
//     _authCubit = AuthCubit(_authRepo);
//   });

//   tearDown(() {
//     _authCubit.isClosed;
//   });

//   group('login', () {
//     blocTest(
//       'emits [UserStatus.loading , UserStatus.loggedIn] when login is successfully',
//       setUp: () => when(() => _authRepo.login(any(), any())).thenAnswer(
//         (_) async => User(name: "Mohamed Mansour", email: "zmzm@gmail.com"),
//       ),
//       build: () => _authCubit,
//       act: (bloc) => bloc.login("zmzm@gmail.com", "123456"),
//       expect: () => [
//         AuthState(status: UserStatus.loading),
//         AuthState(
//           status: UserStatus.loggedIn,
//           user: User(name: "Mohamed Mansour", email: "zmzm@gmail.com"),
//         ),
//       ],
//     );

//     blocTest(
//       'emits [UserStatus.loading , UserStatus.error] when login is failed',
//       setUp: () => when(
//         () => _authRepo.login(any(), any()),
//       ).thenAnswer((_) async => throw Exception("user password is incorrect")),
//       build: () => _authCubit,
//       act: (bloc) => bloc.login("zmzm@gmail.com", "123456"),
//       expect: () => [
//         AuthState(status: UserStatus.loading),
//         AuthState(
//           status: UserStatus.error,
//           errorMessage: "Exception: user password is incorrect",
//         ),
//       ],
//     );
//   });
//   group('signup', () {
//     blocTest(
//       'emits [UserStatus.loading , UserStatus.loggedIn] when signup is successfully',
//       setUp: () => when(
//         () => _authRepo.signup(any(), any(), any()),
//       ).thenAnswer((_) async => User(name: "zmzm", email: "zmzm@gmail.com")),
//       build: () => _authCubit,
//       act: (bloc) => bloc.signup(
//         name: "zmzm",
//         email: "zmzm@gmail.com",
//         password: "123456",
//       ),
//       expect: () => [
//         AuthState(status: UserStatus.loading),
//         AuthState(
//           status: UserStatus.loggedIn,
//           user: User(name: "zmzm", email: "zmzm@gmail.com"),
//         ),
//       ],
//     );

//     blocTest(
//       'emits [UserStatus.loading , UserStatus.error] when signup is failed',
//       setUp: () => when(() => _authRepo.signup(any(), any(), any())).thenAnswer(
//         (_) async => throw Exception("this email is already in use"),
//       ),
//       build: () => _authCubit,
//       act: (bloc) => bloc.signup(
//         name: "zmzm",
//         email: "zmzm@gmail.com",
//         password: "123456",
//       ),
//       expect: () => [
//         AuthState(status: UserStatus.loading),
//         AuthState(
//           status: UserStatus.error,
//           errorMessage: "Exception: this email is already in use",
//         ),
//       ],
//     );
//   });
// }

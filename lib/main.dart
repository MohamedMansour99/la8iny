import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la8iny/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:la8iny/core/di/service_locator.dart';
import 'package:la8iny/features/chat/presentation/blocs/chat_cubit.dart';
import 'package:la8iny/features/splash/presentation/pages/splash_screen.dart';
import 'package:la8iny/firebase_options.dart';

void main() async {
  initServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>()..initialize(),
        ),
        BlocProvider(
          create: (context) => sl<ChatCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarThemeData(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

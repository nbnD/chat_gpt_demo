import 'dart:io';

import 'package:chat_gpt_demo/core/certificate_manager_http.dart';
import 'package:chat_gpt_demo/features/app/routes/on_generate_route.dart';
import 'package:chat_gpt_demo/features/app/splash/splash_screen.dart';
import 'package:chat_gpt_demo/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => di.sl<TextCompletionCubit>(),
        ),
       

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatGPT',
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashScreen(
            
            );
          }
        },
      ),
    );
  }
}

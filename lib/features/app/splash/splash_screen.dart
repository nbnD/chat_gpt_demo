import 'package:chat_gpt_demo/features/app/app_const/routes_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
 

  const SplashScreen({Key? key,}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.QUESTIONANSWER);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/openai-avatar.png",
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}

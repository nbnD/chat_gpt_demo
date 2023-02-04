import 'package:chat_gpt_demo/features/app/app_const/routes_const.dart';
import 'package:chat_gpt_demo/features/text_completion/presentation/pages/text_completion_page.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    
    switch (settings.name) {
      case "/":
        {
          return materialBuilder(
            widget: const ErrorPage(),
          );
        }

      case AppRoutes.QUESTIONANSWER:
        {
          return materialBuilder(
            widget: const TextCompletionPage(),
          );
        }
      default:
        return materialBuilder(
          widget: const ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}

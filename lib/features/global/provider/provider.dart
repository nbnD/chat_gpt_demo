import 'package:chat_gpt_demo/core/constants.dart';


String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
  "Content-Type": "application/json",
  'Authorization': 'Bearer $token',
};

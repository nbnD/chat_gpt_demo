
import 'dart:convert';



import 'package:chat_gpt_demo/core/exceptions.dart';
import 'package:chat_gpt_demo/features/global/provider/provider.dart';

import 'package:chat_gpt_demo/features/text_completion/data/model/text_completion_model.dart';
import 'package:chat_gpt_demo/features/text_completion/data/remote_data_source/text_completion_remote_data_source.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants.dart';

class TextCompletionRemoteDataSourceImpl implements TextCompletionRemoteDataSource{

  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});



  @override
  Future<TextCompletionModel> getTextCompletion(String query)async {
    const String _endPoint = "completions";

    Map<String, String> rowParams = {
      "model":"text-davinci-003",
      "prompt":query,
    };

    final encodedParams = json.encode(rowParams);

    final response = await httpClient.post(
       Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(chatapiKey),
    );

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Text Completion Server Exception");
    }
  }

}
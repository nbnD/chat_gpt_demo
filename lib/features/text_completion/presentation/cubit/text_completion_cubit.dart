import 'dart:io';

import 'package:chat_gpt_demo/core/exceptions.dart';
import 'package:chat_gpt_demo/features/text_completion/data/model/text_completion_model.dart';
import 'package:chat_gpt_demo/features/text_completion/domain/usecases/text_completion_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'text_completion_state.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextCompletionUseCase textCompletionUseCase;
  TextCompletionCubit({required this.textCompletionUseCase}) : super(TextCompletionInitial());


  Future<void> textCompletion({required String query}) async {
    emit(TextCompletionLoading());
    try {
      final textCompletionModelData = await textCompletionUseCase.call(query);
      emit(TextCompletionLoaded(textCompletionModelData: textCompletionModelData));
    } on SocketException catch (e) {
      emit(TextCompletionError(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(TextCompletionError(errorMsg: e.message));
    }
  }
}

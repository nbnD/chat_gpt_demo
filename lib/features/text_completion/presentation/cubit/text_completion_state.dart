part of 'text_completion_cubit.dart';

abstract class TextCompletionState extends Equatable {
  const TextCompletionState();
}

class TextCompletionInitial extends TextCompletionState {
  @override
  List<Object> get props => [];
}

class TextCompletionLoading extends TextCompletionState {
  @override
  List<Object> get props => [];
}
class TextCompletionLoaded extends TextCompletionState {
  final TextCompletionModel textCompletionModelData;

  const TextCompletionLoaded({required this.textCompletionModelData});
  @override
  List<Object> get props => [];
}

class TextCompletionError extends TextCompletionState {
  final String? errorMsg;

  const TextCompletionError({this.errorMsg});
  @override
  List<Object> get props => [];
}
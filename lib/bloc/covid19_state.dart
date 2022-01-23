import 'package:covid19_with_bloc/model/covid19_model.dart';
import 'package:equatable/equatable.dart';

abstract class Covid19State extends Equatable {
  const Covid19State();
}

class Covid19InitialState extends Covid19State {
  @override
  List<Object?> get props => [];
}

class Covid19LoadingState extends Covid19State {
  @override
  List<Object?> get props => [];
}

class Covid19LoadedState extends Covid19State {
  final List<Covid19> covid;

  const Covid19LoadedState({required this.covid});

  @override
  List<Object?> get props => [covid];
}

class Covid19HasErrorState extends Covid19State {
  final String message;

  const Covid19HasErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

import 'package:equatable/equatable.dart';

abstract class Covid19Event extends Equatable {
  const Covid19Event();
}

class GetCovid19Event extends Covid19Event {
  @override
  List<Object?> get props => [];
}

import 'package:covid19_with_bloc/bloc/covid19_event.dart';
import 'package:covid19_with_bloc/bloc/covid19_state.dart';
import 'package:covid19_with_bloc/model/covid19_model.dart';
import 'package:covid19_with_bloc/network/covid19_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Covid19Bloc extends Bloc<Covid19Event, Covid19State> {
  final Covid19Network _covid19network;

  Covid19Bloc(this._covid19network) : super(Covid19InitialState()) {
    on<Covid19Event>((Covid19Event event, Emitter emit) async {
      if (event is GetCovid19Event) {
        emit(Covid19LoadingState());
        try {
          final List<Covid19> covid = await _covid19network.getCovid19();
          debugPrint('Total Length is: ${covid.length}');
          emit(Covid19LoadedState(covid: covid));
        } catch (e) {
          emit(Covid19HasErrorState(
              message: 'THIS ERROR HAS OCCUR ${e.toString()}'));
        }
      }
    });
  }
}

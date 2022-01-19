import 'package:covid19_with_bloc/model/covid19_model.dart';
import 'package:covid19_with_bloc/network/covid19_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Covid19Cubit extends Cubit<List<Covid19>> {
  Covid19Cubit() : super([]);

  void getCovid19Update() async => emit(await Covid19Network().getCovid19());
}

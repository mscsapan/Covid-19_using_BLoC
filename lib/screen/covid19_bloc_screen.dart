import 'package:covid19_with_bloc/bloc/covid19_bloc.dart';
import 'package:covid19_with_bloc/bloc/covid19_state.dart';
import 'package:covid19_with_bloc/model/covid19_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBlocScreen extends StatelessWidget {
  const CovidBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid Bloc Screen'),
      ),
      body: BlocBuilder<Covid19Bloc, Covid19State>(
        builder: (context, state) {
          if (state is Covid19InitialState) {
            return loading();
          } else if (state is Covid19LoadingState) {
            return loading();
          } else if (state is Covid19LoadedState) {
            return getCovidResult(state.covid);
          } else if (state is Covid19HasErrorState) {
            return Center(child: Text(state.message));
          }
          return const Text('Nothing Get');
        },
      ),
    );
  }

  Widget loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget getCovidResult(List<Covid19> covid) {
    return ListView.builder(
        itemCount: covid.length,
        itemBuilder: (context, index) {
          final result = covid[index];
          return ListTile(
            leading: Hero(
              tag: result.countryInfo!.flag.toString(),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  result.countryInfo!.flag.toString(),
                ),
              ),
            ),
            title: Text(
              result.country.toString(),
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          );
        });
  }
}

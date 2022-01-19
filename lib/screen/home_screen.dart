import 'package:covid19_with_bloc/cubit/covid19_cubit.dart';
import 'package:covid19_with_bloc/model/covid19_model.dart';
import 'package:covid19_with_bloc/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid19'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: BlocBuilder<Covid19Cubit, List<Covid19>>(
        builder: (context, List<Covid19> covidState) {
          if (covidState.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: covidState.length,
              itemBuilder: (context, position) {
                final Covid19 covid = covidState[position];
                return ListTile(
                  leading: Hero(
                    tag: covid.countryInfo!.flag.toString(),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage('${covid.countryInfo!.flag}'),
                    ),
                  ),
                  title: Text(
                    covid.country.toString(),
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        country: covid.country.toString(),
                        image: covid.countryInfo!.flag.toString(),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

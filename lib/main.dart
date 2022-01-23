import 'package:covid19_with_bloc/bloc/covid19_bloc.dart';
import 'package:covid19_with_bloc/bloc/covid19_event.dart';
import 'package:covid19_with_bloc/cubit/covid19_cubit.dart';
import 'package:covid19_with_bloc/network/covid19_network.dart';
import 'package:covid19_with_bloc/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  Covid19Bloc(Covid19Network())..add(GetCovid19Event()),
            ),
            BlocProvider(
              create: (_) => Covid19Cubit()..getCovid19Update(),
            ),
          ],
          child: const HomeScreen(),
        ),
      ),
    );

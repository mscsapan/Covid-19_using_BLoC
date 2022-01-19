import 'package:covid19_with_bloc/cubit/covid19_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/home_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => Covid19Cubit()..getCovid19Update(),
          child: const HomeScreen(),
        ),
      ),
    );

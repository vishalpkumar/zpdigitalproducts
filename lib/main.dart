import 'package:ezcountries/bloc/country/country_bloc.dart';
import 'package:ezcountries/page/country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        BlocProvider<CountryBloc>(create: (BuildContext context) => CountryBloc()),
      ],
      child: MaterialApp(
        title: 'Country Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountryPage(),
      )
  ));
}


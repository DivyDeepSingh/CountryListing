import 'package:country_sorting/bloc/themeMode/themeModeBloc.dart';
import 'package:country_sorting/screens/country/countryListing.dart';
import 'package:country_sorting/screens/countryDetails.dart';
import 'package:country_sorting/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryApp extends StatelessWidget {
  const CountryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (BuildContext context, ThemeModeState state) {
        if (state is InitialThemeModeState) {
          BlocProvider.of<ThemeModeBloc>(context).add(InitialThemeModeEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetThemeModeState) {
          return MaterialApp(
            title: 'Country',
            theme: CountryTheme().lightTheme,
            darkTheme: CountryTheme().darkTheme,
            themeMode: state.isLightMode ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // ignore: prefer_const_constructors
              '/': (context) => CountryListing(),
              '/countryDetails': (context) => const CountryDetails(),
            },
          );
        }

        throw "bad state";
      },
    );
  }
}

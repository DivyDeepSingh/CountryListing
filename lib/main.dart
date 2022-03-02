import 'package:country_sorting/bloc/country/countryBloc.dart';
import 'package:country_sorting/bloc/themeMode/themeModeBloc.dart';
import 'package:country_sorting/countryApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MultiBlocProvider(providers: [
              BlocProvider(
                create: (BuildContext context) => ThemeModeBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => CountryBloc(),
              )
            ], child: const CountryApp()));
  }
}

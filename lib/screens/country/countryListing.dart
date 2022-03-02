import 'package:country_sorting/bloc/country/countryBloc.dart';
import 'package:country_sorting/providers/themeProvider.dart';
import 'package:country_sorting/screens/country/ManagingCountry.dart';
import 'package:country_sorting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryListing extends StatelessWidget {
  const CountryListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Countries")),
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is InitialCountryState) {
              BlocProvider.of<CountryBloc>(context)
                  .add(InitialCountryEvent(context));
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CountryLoadedState) {
              return ManagingCountry(
                selectedCode: state.selectedCode,
                countries: state.countries,
                sortedCountries: state.sortedCountries,
              );
            }

            if (state is NoCountryFoundState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage,
                      style: TextStyle(
                          fontSize: 16,
                          color: !ThemeProvider().isLightMode
                              ? CountryColors().kmatchTwoColor
                              : CountryColors().kmatchOneColor,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<CountryBloc>(context)
                          .add(TryAgainEvent()),
                      child: Text(
                        "Try Again!!",
                        style: TextStyle(
                            fontSize: 16,
                            color: !ThemeProvider().isLightMode
                                ? CountryColors().kmatchTwoColor
                                : CountryColors().kmatchOneColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              );
            }

            throw "bad state";
          },
        ));
  }
}

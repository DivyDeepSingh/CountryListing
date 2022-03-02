import 'package:country_sorting/model/countriesModel.dart';
import 'package:country_sorting/providers/countryProvider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'countryEvent.dart';
part 'countryState.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  List<CountriesModel> countries = [];
  List<CountriesModel> forSorting = [];
  String selectedCode = "";
  String selectedQuery = "";
  CountryBloc() : super(InitialCountryState()) {
    on<InitialCountryEvent>((event, emit) async {
      var response = await CountryProvider().getCountries(event.context);

      if (response != null) {
        countries = response;
        forSorting = countries;
        countries.sort((a, b) => a.name!.compareTo(b.name!));
        emit(CountryLoadedState(
            selectedCode: selectedCode,
            countries: countries,
            sortedCountries: forSorting));
      }
    });

    on<SearchCountryEvent>((event, emit) async {
      List<CountriesModel>? filteredList;
      selectedQuery = event.query;
      if (selectedCode != "") {
        filteredList = countries
            .where((i) =>
                i.code!.toLowerCase().contains(selectedQuery.toLowerCase()) &&
                i.code!.toLowerCase() == selectedCode.toLowerCase())
            .toList();
      } else if (selectedQuery != "") {
        filteredList = countries
            .where((i) =>
                i.code!.toLowerCase().contains(selectedQuery.toLowerCase()))
            .toList();
      } else {
        filteredList = countries;
      }

      emit(CountryLoadedState(
          selectedCode: selectedCode,
          countries: filteredList,
          sortedCountries: forSorting));
    });

    on<OnFilterCountryEvent>((event, emit) async {
      List<CountriesModel>? filteredList;

      if (selectedCode != event.query) {
        selectedCode = event.query;
      } else {
        selectedCode = "";
      }

      if (selectedCode != "") {
        filteredList = countries
            .where((i) =>
                i.code!.toLowerCase().contains(selectedQuery.toLowerCase()) &&
                i.code!.toLowerCase() == selectedCode.toLowerCase())
            .toList();
      } else if (selectedQuery != "") {
        filteredList = countries
            .where((i) =>
                i.code!.toLowerCase().contains(selectedQuery.toLowerCase()))
            .toList();
      } else {
        filteredList = countries;
      }

      emit(CountryLoadedState(
          selectedCode: selectedCode,
          countries: filteredList,
          sortedCountries: forSorting));
    });

    on<OnErrorEvent>((event, emit) async {
      emit(NoCountryFoundState(errorMessage: event.errorMessage));
    });
    on<TryAgainEvent>((event, emit) async {
      emit(InitialCountryState());
    });
  }
}

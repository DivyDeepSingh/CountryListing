import 'dart:async';
import 'dart:io';

import 'package:country_sorting/bloc/country/countryBloc.dart';
import 'package:country_sorting/model/countriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';

class CountryProvider {
  GraphQLClient? _client;

  CountryProvider();

  getCountries(BuildContext context) async {
    final _httpLink = HttpLink(
      'https://countries.trevorblades.com/graphql/',
    );
    Link _link = _httpLink;

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );

    const String readRepositories = '''
query alCountries {
 
  countries {
    code 
    name
    native
    emoji
    currency
    languages {
    code
  }
  }
 
   
}

''';

    try {
      final QueryOptions options =
          QueryOptions(document: gql(readRepositories));

      final QueryResult? result = await _client!.query(options);
      if (result!.hasException) {
        if (result.exception!.linkException!.originalException
            is SocketException) {
          BlocProvider.of<CountryBloc>(context)
              .add(OnErrorEvent("Please check you network connection !!"));
        } else if (result.exception!.linkException!.originalException
            is TimeoutException) {
          BlocProvider.of<CountryBloc>(context).add(OnErrorEvent("Timeout !!"));
        } else {
          BlocProvider.of<CountryBloc>(context)
              .add(OnErrorEvent("Something went wrong !!"));
        }

        return;
      } else {
        List<CountriesModel> countries = List.generate(
            result.data!["countries"].length,
            (index) =>
                CountriesModel.fromJson(result.data!["countries"][index]));

        return countries;
      }
    } catch (e) {
      BlocProvider.of<CountryBloc>(context)
          .add(OnErrorEvent("Something went wrong !!"));
    }
  }
}

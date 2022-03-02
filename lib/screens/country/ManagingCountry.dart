import 'package:country_sorting/bloc/country/countryBloc.dart';
import 'package:country_sorting/model/countriesModel.dart';
import 'package:country_sorting/providers/themeProvider.dart';
import 'package:country_sorting/screens/country/header.dart';
import 'package:country_sorting/screens/country/listCard.dart';
import 'package:country_sorting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagingCountry extends StatelessWidget {
  final List<CountriesModel> countries;
  final List<CountriesModel> sortedCountries;
  final String selectedCode;
  const ManagingCountry(
      {Key? key,
      required this.countries,
      required this.sortedCountries,
      required this.selectedCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(parent: ScrollPhysics())),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        child: Column(children: [
          Header(sortedCountries: sortedCountries, selectedCode: selectedCode),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          TextField(
            onChanged: (value) {
              BlocProvider.of<CountryBloc>(context)
                  .add(SearchCountryEvent(value));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                suffixIcon: const Icon(Icons.search),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Type in your text",
                fillColor: Colors.white70),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          countries.isEmpty
              ? Center(
                  child: Text(
                    "No Search Found, Try again!!",
                    style: TextStyle(
                        fontSize: 16,
                        color: !ThemeProvider().isLightMode
                            ? CountryColors().kmatchTwoColor
                            : CountryColors().kmatchOneColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countries.length,
                  // ignore: prefer_const_constructors
                  itemBuilder: (context, i) => ListCard(country: countries[i]),
                ),
        ]),
      ),
    );
  }
}

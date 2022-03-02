import 'package:country_sorting/model/countriesModel.dart';
import 'package:country_sorting/providers/themeProvider.dart';
import 'package:country_sorting/screens/country/details.dart';
import 'package:country_sorting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCard extends StatelessWidget {
  final CountriesModel country;
  const ListCard({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed("/countryDetails", arguments: {"details": country}),
      child: Card(
        color: !ThemeProvider().isLightMode
            ? CountryColors().kmatchTwoColor
            : CountryColors().kmatchOneColor,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: ScreenUtil().setWidth(40),
                      backgroundColor: Colors.brown.shade800,
                      child: Text(
                        country.emoji!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Details(
                            title: "Country",
                            description: country.name! + " " + country.emoji!,
                          ),
                          Details(
                              title: "Language", description: country.code!),
                          Details(
                            title: "Captial",
                            description: country.native!,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

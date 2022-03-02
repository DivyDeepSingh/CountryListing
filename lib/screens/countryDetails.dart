import 'package:country_sorting/model/countriesModel.dart';
import 'package:country_sorting/providers/themeProvider.dart';
import 'package:country_sorting/screens/country/details.dart';
import 'package:country_sorting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetails extends StatelessWidget {
  const CountryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    CountriesModel country = arguments["details"];
    return Scaffold(
        backgroundColor: !ThemeProvider().isLightMode
            ? CountryColors().kmatchTwoColor
            : CountryColors().kmatchOneColor,
        appBar: AppBar(
          title: Text(country.name!),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: ScreenUtil().setWidth(80),
                        backgroundColor: Colors.brown.shade800,
                        child: Text(
                          country.emoji!,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      Details(
                        title: "Country",
                        description: country.name! + " " + country.emoji!,
                      ),
                      Details(title: "Language", description: country.code!),
                      Details(
                        title: "Captial",
                        description: country.native!,
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}

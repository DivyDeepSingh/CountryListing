import 'package:country_sorting/bloc/country/countryBloc.dart';
import 'package:country_sorting/bloc/themeMode/themeModeBloc.dart';
import 'package:country_sorting/model/countriesModel.dart';
import 'package:country_sorting/providers/themeProvider.dart';
import 'package:country_sorting/utils/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final List<CountriesModel> sortedCountries;
  final String selectedCode;
  const Header(
      {Key? key, required this.selectedCode, required this.sortedCountries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "Switch to ${!ThemeProvider().isLightMode ? "light" : "dark"} mode",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 16,
                      color: !ThemeProvider().isLightMode
                          ? CountryColors().kmatchTwoColor
                          : CountryColors().kmatchOneColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Switch(
                  activeTrackColor: !ThemeProvider().isLightMode
                      ? CountryColors().kmatchTwoColor
                      : CountryColors().kmatchOneColor,
                  activeColor: CountryColors().kmatchTwoColor,
                  inactiveThumbColor: CountryColors().yellow,
                  inactiveTrackColor: !ThemeProvider().isLightMode
                      ? CountryColors().kmatchTwoColor
                      : CountryColors().kmatchOneColor,
                  value: !ThemeProvider().isLightMode,
                  onChanged: (bool value) async {
                    BlocProvider.of<ThemeModeBloc>(context)
                        .add(SetThemeModeEvent());
                  }),
            ],
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Icon(
              Icons.sort,
              color: !ThemeProvider().isLightMode
                  ? CountryColors().kmatchTwoColor
                  : CountryColors().kmatchOneColor,
              size: 40,
            ),
            dropdownMaxHeight: ScreenUtil().setHeight(400.00),
            dropdownWidth: ScreenUtil().setWidth(100),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: !ThemeProvider().isLightMode
                  ? CountryColors().kmatchTwoColor
                  : CountryColors().kmatchOneColor,
            ),
            dropdownElevation: 8,
            offset: const Offset(0, 8),
            items: [
              ...sortedCountries.map(
                (item) => DropdownMenuItem<CountriesModel>(
                    value: item,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            item.emoji!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.code!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        selectedCode.toLowerCase() == item.code!.toLowerCase()
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: ScreenUtil().setWidth(20),
                              )
                            : Container(),
                      ],
                    )),
              ),
            ],
            onChanged: (CountriesModel? value) {
              BlocProvider.of<CountryBloc>(context)
                  .add(OnFilterCountryEvent(value!.code!));
            },
          ),
        ),
      ],
    );
  }
}

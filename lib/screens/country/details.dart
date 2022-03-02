import 'package:country_sorting/providers/themeProvider.dart';
import 'package:country_sorting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatelessWidget {
  final String title;
  final String description;
  const Details({Key? key, required this.description, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(10),
          horizontal: ScreenUtil().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "$title :",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ThemeProvider().isLightMode
                      ? CountryColors().kmatchTwoColor
                      : CountryColors().kmatchOneColor),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ThemeProvider().isLightMode
                      ? CountryColors().kmatchTwoColor
                      : CountryColors().kmatchOneColor),
            ),
          ),
        ],
      ),
    );
  }
}

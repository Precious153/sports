import 'package:flutter/material.dart';
import 'package:sports/core/size_config.dart';

import '../../core/constant.dart';
import '../../core/reuseable_widgets/general_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20)
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(top: getProportionateScreenHeight(22)),
                    child: Center(
                      child: generalText(
                          inputText: 'Settings',
                          fontSize: 20,
                          weight: FontWeight.w500,
                          color: Palette.blackColor),
                    ),

                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30),),
              generalText(
              inputText: 'Change Password',
              fontSize: 20,
              weight: FontWeight.w500,
              color: Palette.blackColor),
              SizedBox(height: getProportionateScreenHeight(20),),
              generalText(
                  inputText: 'Update Email',
                  fontSize: 20,
                  weight: FontWeight.w500,
                  color: Palette.blackColor),
              SizedBox(height: getProportionateScreenHeight(20),),
              generalText(
                  inputText: 'Update UserName',
                  fontSize: 20,
                  weight: FontWeight.w500,
                  color: Palette.blackColor),
              SizedBox(height: getProportionateScreenHeight(20),),

              generalText(
                  inputText: 'Log Out',
                  fontSize: 20,
                  weight: FontWeight.w500,
                  color: Palette.redColor),

            ],
          ),
        ),
      ),
    );
  }
}

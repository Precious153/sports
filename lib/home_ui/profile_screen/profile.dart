import 'package:flutter/material.dart';
import 'package:sports/core/size_config.dart';

import '../../core/constant.dart';
import '../../core/reuseable_widgets/general_text.dart';
import '../../core/reuseable_widgets/reuseable.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                          inputText: 'Personal Details',
                          fontSize: 20,
                          weight: FontWeight.w500,
                          color: Palette.blackColor),
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Icon(Icons.account_circle,
              color: Palette.textColor,
                size: 100,
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              buildProfileDetailsContainer(
                  profileHintText: 'Username',
                  profileInputText: 'Precious'
              ),
              buildProfileDetailsContainer(
                  profileHintText: 'Phone Number',
                  profileInputText: '+2347063268351'),
              buildProfileDetailsContainer(
                  profileHintText: 'Email Address',
                  profileInputText: 'adeleyeprecious16@gmail.com'
              ),
            ],
          ),
        ),
      ),
    );
  }
}

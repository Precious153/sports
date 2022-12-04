import 'package:flutter/material.dart';
import 'package:sports/core/size_config.dart';
import 'package:sports/home_ui/nav.dart';

import '../core/constant.dart';
import '../core/reuseable_widgets/general_button.dart';
import '../core/reuseable_widgets/general_text.dart';
import '../core/reuseable_widgets/reuseable.dart';
import 'login_email.dart';
import 'login_phone.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:getProportionateScreenHeight(40),),
                  generalText(
                      inputText: 'Log In',
                      fontSize: 32,
                      weight: FontWeight.w900,
                      color: Palette.textColor),
                  SizedBox(height: getProportionateScreenHeight(20),),
                  generalText(
                      inputText: 'Fill in the information requested below to Log into your registered account',
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: Palette.greyColor),

                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  TabBar(
                    indicatorColor: Palette.textColor,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Palette.textColor,
                    tabs: [
                      Tab(text: 'Email',),
                      Tab(text: 'Phone',),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20),),
                  Container(
                    height: getProportionateScreenHeight(300),
                    width: double.infinity,
                    color: Colors.white,
                    child: TabBarView(
                      children: [
                        Email(),
                        Phone(),
                      ],
                    ),
                  ),
                  BuildCustomButton(
                    onPressed:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          Nav()));
                    },
                    buttonChild:
                    generalText(
                        inputText: 'Login',
                        fontSize: 16,
                        weight: FontWeight.w700,
                        color: Palette.whiteColor),
                    containerHeight: 60,
                    containerWidth: 366,
                    borderRadiusSize: 100,
                    buttonColor: Palette.textColor,
                    borderColor: Palette.greyColor,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

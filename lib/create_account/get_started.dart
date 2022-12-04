import 'package:flutter/material.dart';
import 'package:sports/core/reuseable_widgets/general_text.dart';
import 'package:sports/core/size_config.dart';

import '../core/constant.dart';
import '../core/reuseable_widgets/general_button.dart';
import '../core/reuseable_widgets/reuseable.dart';
import '../login_user/login.dart';
import 'email_otp_verification.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
final _username = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

bool _isObscured = true;
bool _isLoading = false;

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:getProportionateScreenHeight(40),),
                generalText(
                    inputText: 'Get Started',
                    fontSize: 32,
                    weight: FontWeight.w900,
                    color: Palette.textColor),
                SizedBox(height: getProportionateScreenHeight(20),),
                generalText(
                    inputText: 'Fill in the information requested below ',
                    fontSize: 16,
                    weight: FontWeight.w400,
                    color: Palette.greyColor),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                BuildInputField(
                  inputController: _username,
                  inputHintText: 'Username',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                BuildEmailInputField(
                  inputController: _emailController,
                  inputHintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                BuildPasswordInputField(
                  isObscured: _isObscured,
                  inputController: _passwordController,
                  inputHintText: 'Password',
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });

                    },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                generalText(
                    inputText:
                    'Must contain: Uppercase, Lowercase, Number & Special character',
                    fontSize: 14,
                    weight: FontWeight.w300,
                    color: Palette.greyColor),
                SizedBox(
                  height: getProportionateScreenHeight(110),
                ),
                BuildCustomButton(
                  onPressed:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        EmailOtp()));
                  },
                  buttonChild:
                       generalText(
                      inputText: 'Proceed',
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
    );
  }
}

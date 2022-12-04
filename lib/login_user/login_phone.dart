import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports/core/reuseable_widgets/general_text.dart';
import 'package:sports/core/size_config.dart';

import '../core/constant.dart';
import '../core/reuseable_widgets/reuseable.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final _phoneNumberController = TextEditingController();
  bool _isObscured = true;
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
      SizeConfig.init(context);
    return Column(
      children: [
        Row(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(11)),
                  height: getProportionateScreenHeight(60),
                  width: getProportionateScreenWidth(110),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Palette.textFieldColor),
                  child: Row(
                    children: [
                      Image.asset('images/nigerialogo.png'),
                      SizedBox(
                        width: getProportionateScreenWidth(8),
                      ),
                      generalText(
                          inputText: '+234',
                          fontSize: 16,
                          weight: FontWeight.w400,
                          color: Palette.hintTextColor)
                    ],
                  )),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Expanded(
                child: TextFormField(
                  controller: _phoneNumberController,
                  cursorColor: Palette.blackColor,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.lato(
                          color: Palette.hintTextColor,
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w400),
                      filled: true,
                      fillColor: Palette.textFieldColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none)),
                  onChanged: (value) async {
                    value = "234${_phoneNumberController.text}";
                  },
                ),
              ),

            ],
        ),
        SizedBox(height: getProportionateScreenHeight(20),),

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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            generalText(
                inputText:
                'Forgot password?',
                fontSize: 14,
                weight: FontWeight.w300,
                color: Palette.textColor),
          ],
        ),
      ],
    );
  }
}

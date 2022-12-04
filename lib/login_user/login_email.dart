import 'package:flutter/material.dart';
import 'package:sports/core/size_config.dart';

import '../core/constant.dart';
import '../core/reuseable_widgets/general_text.dart';
import '../core/reuseable_widgets/reuseable.dart';
class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  bool _isObscured = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
        children: [
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

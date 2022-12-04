import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sports/core/size_config.dart';

import '../core/constant.dart';
import '../core/reuseable_widgets/general_text.dart';
import '../login_user/login.dart';
class EmailOtp extends StatefulWidget {
  const EmailOtp({Key? key}) : super(key: key);

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  final GlobalKey<FormState> _emailOtpPinKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? _emailOtpErrorController;
  TextEditingController _emailOtpController = TextEditingController();
  Duration duration = Duration();
  Timer? timer;
  bool _isLoading = false;

  String _emailOtpText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void reset() {
    setState(() {
      duration = Duration(minutes: 3);
    });
  }

  void addTime() {
    final addSeconds = -1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
        // reset();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    reset();
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left:
          getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:getProportionateScreenHeight(20),),
              generalText(
                  inputText: 'Verify Email',
                  fontSize: 20,
                  weight: FontWeight.w500,
                  color: Palette.textColor),
              SizedBox(height: getProportionateScreenHeight(20),),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text:
                    'We have sent a 4-digit verification code to your registered email address',
                    style: GoogleFonts.lato(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w400,
                        color: Palette.greyColor),
                    children: [
                      TextSpan(
                        text: 'adeleyeprecious16@gmail.com',
                        style: GoogleFonts.lato(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w700,
                            color: Palette.greyColor),
                      ),
                    ]),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: generalText(
                      inputText: 'Change Email',
                      fontSize: 16,
                      weight: FontWeight.w700,
                      color: Palette.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              Form(
                key: _emailOtpPinKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(63)),
                  child: PinCodeTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    autoDisposeControllers: false,
                    enableActiveFill: true,
                    appContext: context,
                    onChanged: (value) async {
                      setState(() {
                        _emailOtpText = value;
                      });
                    },
                    onCompleted: (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      LogIn()));
                    },
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    pastedTextStyle: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.bold),
                    length: 4,
                    animationType: AnimationType.slide,
                    cursorColor: Palette.blackColor,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: getProportionateScreenHeight(46),
                      fieldWidth: getProportionateScreenWidth(46),
                      activeFillColor: Palette.textFillContainerColor,
                      inactiveColor: Palette.textFillContainerColor,
                      activeColor: Palette.textFillContainerColor,
                      inactiveFillColor: Palette.textFillContainerColor,
                      selectedFillColor: Palette.textFillContainerColor,
                      selectedColor: Palette.textFillContainerColor,
                    ),
                    validator: (v) {
                      if (v!.length < 4) {
                        return "Enter the 4 digit PIN sent to your mail";
                      } else {
                        return null;
                      }
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                    controller: _emailOtpController,
                    animationDuration: const Duration(microseconds: 300),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '$minutes:$seconds',
                      style: GoogleFonts.lato(
                        color: Palette.textColor,
                        fontSize: getProportionateScreenHeight(16),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(11)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      generalText(
                        inputText: 'Didn\'t get PIN?',
                        fontSize: 16,
                        weight: FontWeight.w400,
                        color: Palette.blackColor,
                      ),
                      TextButton(
                          onPressed: () {
                            startTimer();
                          },
                          child: Text(
                            "Resend",
                            style: GoogleFonts.lato(
                              color: Palette.textColor,
                              fontSize: getProportionateScreenHeight(16),
                              fontWeight: FontWeight.w700,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

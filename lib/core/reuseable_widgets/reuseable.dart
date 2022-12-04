import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports/core/reuseable_widgets/general_text.dart';
import 'package:sports/core/size_config.dart';

import '../constant.dart';
class BuildInputField extends StatefulWidget {
  BuildInputField(
      {required this.inputController,
        required this.inputHintText,
        required this.keyboardType,
        this.onChanged,
        this.maxLength,
        this.enabled,
        this.suffix,
        this.onTap,
        bool? isObscured,
        Function()? onPressed});

  TextEditingController inputController;
  String inputHintText;
  TextInputType keyboardType;
  int? maxLength;
  bool? enabled;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}
class _BuildInputFieldState extends State<BuildInputField> {
  bool showHint = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(11)),
          child: showHint
              ? generalText(
              inputText: widget.inputHintText,
              fontSize: 16,
              weight: FontWeight.w400,
              color: Palette.hintTextColor)
              : null,
        ),
        SizedBox(
          height: getProportionateScreenHeight(6),
        ),
        Center(
          child: TextFormField(
            autofocus: false,
            controller: widget.inputController,
            keyboardType: widget.keyboardType,
            cursorColor: Palette.blackColor,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Palette.textFieldColor,
              suffix: Padding(
                padding:
                EdgeInsets.only(right: getProportionateScreenWidth(25.67)),
                child: widget.suffix,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText: widget.inputHintText,
              hintStyle: GoogleFonts.lato(
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w400,
                  color: Palette.hintTextColor),
            ),
            validator: (value) =>
            value!.isEmpty ? 'Enter ${widget.inputHintText}' : null,
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  showHint = false;
                } else {
                  showHint = true;
                }
              });
            },
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}
class BuildEmailInputField extends StatefulWidget {
  BuildEmailInputField(
      {required this.inputController,
        required this.inputHintText,
        required this.keyboardType,
        this.onChanged,
        this.suffix,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  TextInputType keyboardType;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;

  @override
  State<BuildEmailInputField> createState() => _BuildEmailInputFieldState();
}

class _BuildEmailInputFieldState extends State<BuildEmailInputField> {
  bool showHint = false;

  String? emailValidator(String? value) {
    final String val = value!.trim();
    final RegExp reg =
    RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$");
    if (!reg.hasMatch(val)) {
      return 'Invalid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(11)),
          child: showHint
              ? generalText(
              inputText: widget.inputHintText,
              fontSize: 16,
              weight: FontWeight.w400,
              color: Palette.hintTextColor)
              : null,
        ),
        SizedBox(
          height: getProportionateScreenHeight(6),
        ),
        Center(
          child: TextFormField(
            controller: widget.inputController,
            keyboardType: widget.keyboardType,
            cursorColor: Palette.blackColor,
            autocorrect: false,
            autofillHints: const [AutofillHints.email],
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              fillColor: Palette.textFieldColor,
              suffix: Padding(
                padding:
                EdgeInsets.only(right: getProportionateScreenWidth(25.67)),
                child: widget.suffix,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText: widget.inputHintText,
              hintStyle: GoogleFonts.lato(
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w400,
                  color: Palette.hintTextColor),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter email';
              } else {
                emailValidator(value);
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  showHint = false;
                } else {
                  showHint = true;
                }
              });
            },
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}

class BuildPasswordInputField extends StatefulWidget {
  BuildPasswordInputField(
      {required this.inputController,
        required this.inputHintText,
        required this.isObscured,
        required this.onPressed,
        this.onFieldSubmitted,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  bool isObscured;
  Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<BuildPasswordInputField> createState() =>
      _BuildPasswordInputFieldState();
}

class _BuildPasswordInputFieldState extends State<BuildPasswordInputField> {
  bool showHint = false;

  RegExp passwordvalid = RegExp(r'(?=.*[a-z])');
  RegExp passwordvalid2 = RegExp(r'(?=.*[A-Z])');
  RegExp passwordvalid3 = RegExp(r'(?=.*[0-9])');
  RegExp passwordvalid4 = RegExp(r'(?=.*[^A-Za-z0-9])');
  RegExp passwordvalid5 = RegExp(r'(?=.{8,})');

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (passwordvalid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword2(String pass) {
    String _password = pass.trim();
    if (passwordvalid2.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword3(String pass) {
    String _password = pass.trim();
    if (passwordvalid3.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword4(String pass) {
    String _password = pass.trim();
    if (passwordvalid4.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword5(String pass) {
    String _password = pass.trim();
    if (passwordvalid5.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(11)),
          child: showHint
              ? generalText(
              inputText: widget.inputHintText,
              fontSize: 16,
              weight: FontWeight.w400,
              color: Palette.hintTextColor)
              : null,
        ),
        SizedBox(
          height: getProportionateScreenHeight(6),
        ),
        TextFormField(
          controller: widget.inputController,
          obscureText: widget.isObscured ? true : false,
          cursorColor: Palette.blackColor,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.textFieldColor,
            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Padding(
                padding:
                EdgeInsets.only(right: getProportionateScreenWidth(10)),
                child: Icon(
                  widget.isObscured ? Icons.visibility : Icons.visibility_off,
                  color: Palette.suffixIconColor,
                  size: getProportionateScreenWidth(22),
                ),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            hintText: widget.inputHintText,
            hintStyle: GoogleFonts.lato(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w400,
                color: Palette.hintTextColor),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a password';
            } else {
              bool result = validatePassword(value);
              if (result == false) {
                return 'Password should contain small letter';
              } else {
                bool result2 = validatePassword2(value);
                if (result2 == false) {
                  return 'Password should contain capital letter';
                } else {
                  bool result3 = validatePassword3(value);
                  if (result3 == false) {
                    return 'Password should contain number';
                  } else {
                    bool result4 = validatePassword4(value);
                    if (result4 == false) {
                      return 'Password should contain special character';
                    } else if (value.length < 8) {
                      return 'Password should be atleast 8 characters';
                    } else {}
                  }
                }
              }
            }
          },
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
      ],
    );
  }
}


class BuildAuthenticationScaffold extends StatelessWidget {
  BuildAuthenticationScaffold({
    required this.isBackIcon,
    required this.titleText,
    required this.child,
  });

  bool isBackIcon;
  String titleText;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blackColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isBackIcon
                ? Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(24),
                    top: getProportionateScreenHeight(18),
                    bottom: getProportionateScreenHeight(7),
                  ),
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(40),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Palette.greyColor),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: getProportionateScreenWidth(15),
                          color: Palette.blackColor,
                        )),
                  ),
                ),
              ],
            )
                : SizedBox(
              height: getProportionateScreenHeight(65),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(24),
                    bottom: getProportionateScreenHeight(24),
                  ),
                  child: Text(
                    titleText,
                    style: const TextStyle(
                        color: Palette.whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Palette.whiteColor),
                  child: child),
            ),
          ],
        ),
      ),
    );
  }
}


Container buildProfileDetailsContainer(
    {required String profileHintText, required String profileInputText}) {
  return Container(
    height: getProportionateScreenHeight(60),
    margin: EdgeInsets.only(
      bottom: getProportionateScreenHeight(20),
    ),
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(
        top: getProportionateScreenHeight(8),
        //bottom: getProportionateScreenHeight(8),
        left: getProportionateScreenWidth(16),
        right: getProportionateScreenWidth(16)
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Palette.greyColor2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: generalText(
              inputText: profileHintText,
              fontSize: 12,
              weight: FontWeight.w300,
              color: Palette.greyColor),
        ),
        Expanded(
          child: generalText(
              inputText: profileInputText,
              fontSize: 16,
              weight: FontWeight.w400,
              color: Palette.blackColor),
        ),
      ],
    ),
  );
}


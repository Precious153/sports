import 'package:flutter/material.dart';

import '../size_config.dart';

class BuildCustomButton extends StatelessWidget {
  BuildCustomButton(
      {required this.onPressed,
        required this.containerHeight,
        required this.containerWidth,
        required this.borderRadiusSize,
        required this.buttonColor,
        required this.borderColor,
        required this.buttonChild});

  void Function()? onPressed;
  Widget buttonChild;
  double containerHeight;
  double containerWidth;
  double borderRadiusSize;
  Color buttonColor;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(containerHeight),
      width: getProportionateScreenWidth(containerWidth),
      child: ElevatedButton(
        onPressed: onPressed,
        child: buttonChild,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                side: BorderSide(color: borderColor))),
      ),
    );
  }
}

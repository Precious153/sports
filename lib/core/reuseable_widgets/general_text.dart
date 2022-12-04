
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';


Text generalText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color color,
  bool? softWrap,
  double letterSpacing = 0.0,
  TextAlign? textAlign,
}) {
  return Text(
    inputText,
    textAlign: textAlign,
    softWrap: softWrap,
    style: GoogleFonts.lato(
        letterSpacing: getProportionateScreenWidth(letterSpacing),
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: color),
  );
}

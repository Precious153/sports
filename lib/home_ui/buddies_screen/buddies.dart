import 'package:flutter/material.dart';
import 'package:sports/core/constant.dart';
import 'package:sports/core/reuseable_widgets/general_text.dart';
class Buddies extends StatelessWidget {
  const Buddies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            generalText(inputText: 'Buddies',
                fontSize: 20,
                weight: FontWeight.w500,
                color: Palette.textColor),
          ],
        ),
      ),

    );
  }
}

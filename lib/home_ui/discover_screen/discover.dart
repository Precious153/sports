import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../../core/reuseable_widgets/general_text.dart';
class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            generalText(inputText: 'Discover',
                fontSize: 20,
                weight: FontWeight.w500,
                color: Palette.textColor),
          ],
        ),
      ),

    );
  }
}

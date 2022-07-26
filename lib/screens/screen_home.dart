import 'package:flutter/material.dart';
import 'package:sample_api/core/constents/buttons/buttons.dart';
import 'package:sample_api/core/constents/colors/colors.dart';
import 'package:sample_api/core/constents/height_width/height_width.dart';
import 'package:sample_api/core/constents/textstyles/textstyles.dart';
import 'package:sample_api/core/routes/router.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SAMPLE QUIZ",
              style: headLineText,
            ),
            kHeight40,
            ButtonWidgets(
              title: "Get Start",
              onPressed: () {
                Navigator.pushNamed(context, routeQuestions);
              },
            ),
          ],
        ),
      ),
    );
  }
}

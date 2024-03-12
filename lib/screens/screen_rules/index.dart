import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/button_green.dart';
import 'components/text_widget.dart';

class ScreenRules extends StatelessWidget {
  const ScreenRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gMainColor,
      body: Container(
        margin: EdgeInsets.only(top: 98.0),
        child: Column(
          children: [
            Container(
              height: 461.0,
              margin: const EdgeInsets.only(top: 0.0, bottom: 50.0),
              child: const TextWidget(),
            ),
            ButtonGreen(
              text: 'Понятненько',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

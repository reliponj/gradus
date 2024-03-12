import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/routes.dart';

class ScreenTop extends StatelessWidget {
  const ScreenTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32.0,
            height: 32.0,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.transparent),
              onPressed: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/icon-back-arrow.svg'),
            ),
          ),
          Row(
            children: [
              Text(
                'Активно:',
                style: TextStyle(
                  fontFamily: gFontRobReg,
                  fontSize: 12.0,
                  color: gWhiteColor.withOpacity(0.5),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                margin: const EdgeInsets.only(left: 10.0, right: 4.0),
                decoration: BoxDecoration(
                    color: gGreenColor,
                    borderRadius: BorderRadius.circular(4.0)),
                child: const Text(
                  '65',
                  style: TextStyle(fontSize: 16.0, fontFamily: gFontRobBold),
                ),
              ),
              const Text('карт', style: TextStyle(
                fontFamily: gFontRobReg,
                fontSize: 12.0,
                color: gWhiteColor,
              ),),
            ],
          ),
          Container(
            width: 18.0,
            height: 18.0,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.transparent),
              onPressed: () {
                gradusNavigator(context, Routes.startInfo);
              },
              child: SvgPicture.asset('assets/icons/question.svg'),
            ),
          )
        ],
      ),
    );
  }
}

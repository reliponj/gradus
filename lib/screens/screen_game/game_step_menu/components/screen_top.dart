import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/constants.dart';

class ScreenTop extends StatelessWidget {
  const ScreenTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45.0),
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
          Text(
            'Бонус Меню',
            style: TextStyle(
              fontFamily: gFontNunBold,
              fontSize: 20.0,
            ),
          ),
          SvgPicture.asset('assets/icons/question.svg')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/constants.dart';

class CustomNotification extends StatelessWidget {
  String text;
  bool error;

  CustomNotification({
    Key? key,
    required this.text,
    this.error = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: error ? gPurpleColor : gGreenColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: "RobotoCondensed Regular",
                fontSize: 14,
                color: Colors.white
            ),
          ),
          SvgPicture.asset(
            error ? 'assets/images/close.svg' : 'assets/images/check.svg',
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/constants.dart';

class ScreenTop extends StatefulWidget {

  const ScreenTop({
    super.key,
    required this.cardsToGame,
  });

  final dynamic cardsToGame;

  @override
  State<ScreenTop> createState() => _ScreenTopState();
}

class _ScreenTopState extends State<ScreenTop> {
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
            '${widget.cardsToGame.cardScore} баллов',
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Player {
  Player({
    required this.id,
    required this.title,
    required this.colorIcon,
    required this.colorBody,
    required this.icon,
    this.score = 0
  });

  String id;
  String title;
  Color colorIcon;
  Color colorBody;
  SvgPicture icon;
  int score;
}
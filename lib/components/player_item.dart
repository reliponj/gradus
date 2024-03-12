import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/models/Player.dart';

import '../constants.dart';
import '../states.dart';

class PlayerItem extends StatelessWidget {
  PlayerItem({
    super.key,
    required this.player,
    required this.onChanged,
  });

  Player player;
  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(bottom: 14.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70.0,
                width: 265.0,
                child: Stack(
                  children: [
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: player.colorBody,
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                              color: player.colorIcon,
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(
                                width: 1.0,
                                color: gMainColor,
                              )),
                          child: Center(
                            child: player.icon,
                          ),
                        ),
                        SizedBox(
                          width: 11.0,
                        ),
                        Flexible(
                          child: TextField(
                            controller: TextEditingController(text: player.title),
                            onChanged: onChanged,
                            style: TextStyle(
                              fontFamily: gFontNunBold,
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

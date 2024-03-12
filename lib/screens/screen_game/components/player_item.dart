import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/models/Player.dart';

import '../../../constants.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(bottom: 14.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 82.0,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Stack(
                  children: [
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 65.0,
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
                          width: 82.0,
                          height: 82.0,
                          decoration: BoxDecoration(
                            color: player.colorIcon,
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              width: 1.0,
                              color: gMainColor,
                            )
                          ),
                          child: Center(
                            child: player.icon,
                          ),
                        ),
                        SizedBox(
                          width: 11.0,
                        ),
                        Flexible(
                          child: Text(
                            player.title,
                            style: TextStyle(
                              fontFamily: gFontNunBold,
                              fontSize: 16.0,
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

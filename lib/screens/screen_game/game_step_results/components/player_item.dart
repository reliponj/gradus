import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/constants.dart';

class PlayerItemWinner extends StatelessWidget {

  const PlayerItemWinner({
    super.key,
    required this.title,
    required this.colorIcon,
    required this.colorBody,
    required this.icon,
    required this.litres,
    required this.isWinner,
    required this.id,
  });

  final String id;
  final bool isWinner;
  final String title;
  final Color colorIcon;
  final Color colorBody;
  final SvgPicture icon;
  final String litres;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(bottom: 14.0),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 35,
                  ),
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
                                color: colorBody,
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
                                  color: colorIcon,
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: gMainColor,
                                  )),
                              child: Center(
                                child: icon,
                              ),
                            ),
                            SizedBox(
                              width: 11.0,
                            ),
                            Flexible(
                              child: Text(
                                title,
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
                  SizedBox(
                    width: 3.0,
                  ),
                  SizedBox(
                    width: 35,
                    child: Text(
                      litres,
                      style: TextStyle(fontSize: 12.0, fontFamily: gFontRobReg),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width / 13,
                child: SvgPicture.asset(isWinner ? 'assets/icons/beer-winner-true.svg' : 'assets/icons/beer-winner-false.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

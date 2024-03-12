import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/components/button_outline.dart';
import 'package:gradus/components/wrapper_screens_elems.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/helpers/navigator.dart';
import 'components/screen_top.dart';
import 'components/text_widget.dart';

class GameStepMenu extends StatelessWidget {
  const GameStepMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreensElems(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              ScreenTop(),
              SizedBox(height: 23.0),
              SizedBox(
                width: 310.0,
                child: Text(
                  'Если используешь сейчас, то не сможешь поиздеваться над игроками в конце хода.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: gFontRobReg,
                      fontSize: 16.0,
                      color: gWhiteColor.withOpacity(0.5)),
                ),
              ),
              SizedBox(height: 22.0),


              // РЕФАКТОР!!!
              // РЕФАКТОР!!!
              // РЕФАКТОР!!!
              Container(
                height: MediaQuery.of(context).size.height - 220,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            TextWidget(
                              label: 'У тебя',
                              text: '50 баллов ',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextWidget(
                              label: 'Ты на',
                              text: '1 месте ',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextWidget(
                              label: 'Если ты выберешь',
                              text: 'Жаренная картошка ',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextWidget(
                              label: 'то потратишь',
                              text: '30 баллов ',
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Можно использовать меню \nтолько 1 раз в ход.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: gMainColor.withOpacity(0.5),
                                fontSize: 16.0,
                                fontFamily: gFontRobReg,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      gradusNavigator(context, '/game-step-looser');
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      foregroundColor: gWhiteColor,
                                    ),
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50.0),
                                          border: Border.all(
                                            width: 1.0,
                                            color: gGreenColor,
                                          )),
                                      child: Center(
                                        child: Text(
                                          'Фигушки'.toUpperCase(),
                                          style: TextStyle(
                                            color: gGreenColor,
                                            fontFamily: gFontNunBold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      gradusNavigator(context, '/game-step-winner');
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      foregroundColor: gWhiteColor,
                                    ),
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50.0),
                                          color: gGreenColor),
                                      child: Center(
                                        child: Text(
                                          'конечно'.toUpperCase(),
                                          style: TextStyle(
                                            color: gWhiteColor,
                                            fontFamily: gFontNunBlack,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Меню Желаний ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: gMainColor.withOpacity(0.5),
                                    fontFamily: gFontNunBlack),
                                children: [
                                  TextSpan(
                                    text: "Двигай Телом",
                                    style: TextStyle(fontFamily: gFontNunReg),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/lock.svg')
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Меню Желаний ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: gMainColor.withOpacity(0.5),
                                    fontFamily: gFontNunBlack),
                                children: [
                                  TextSpan(
                                    text: "Двигай Телом",
                                    style: TextStyle(fontFamily: gFontNunReg),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/lock.svg')
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Меню Желаний ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: gMainColor.withOpacity(0.5),
                                    fontFamily: gFontNunBlack),
                                children: [
                                  TextSpan(
                                    text: "Двигай Телом",
                                    style: TextStyle(fontFamily: gFontNunReg),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/lock.svg')
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Меню Желаний ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: gMainColor.withOpacity(0.5),
                                    fontFamily: gFontNunBlack),
                                children: [
                                  TextSpan(
                                    text: "Двигай Телом",
                                    style: TextStyle(fontFamily: gFontNunReg),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/lock.svg')
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Меню Желаний ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: gMainColor.withOpacity(0.5),
                                    fontFamily: gFontNunBlack),
                                children: [
                                  TextSpan(
                                    text: "Двигай Телом",
                                    style: TextStyle(fontFamily: gFontNunReg),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/lock.svg')
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: gWhiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Меню Желаний ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: gMainColor.withOpacity(0.5),
                                    fontFamily: gFontNunBlack),
                                children: [
                                  TextSpan(
                                    text: "Двигай Телом",
                                    style: TextStyle(fontFamily: gFontNunReg),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/lock.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // РЕФАКТОР!!!
              // РЕФАКТОР!!!
              // РЕФАКТОР!!!
            ],
          ),
        ),
      ),
    );
  }
}

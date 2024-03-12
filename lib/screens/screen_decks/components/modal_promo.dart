import 'package:flutter/material.dart';
import 'package:gradus/components/modal_wrapper.dart';
import 'package:gradus/constants.dart';

import 'custom_input.dart';

class ModalPromo extends StatelessWidget {
  const ModalPromo({
    super.key, this.onPressed,
  });

  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      onPressed: onPressed,
      innerWidget: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4.0),
                        color: gMainColor.withOpacity(0.15),
                        blurRadius: 4.0,
                      )
                    ],
                  ),
                  child:
                  Image.asset('assets/images/card-back-side.png'),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Двигай телом',
                              style: TextStyle(
                                  color: gMainColor,
                                  fontFamily: gFontNunBold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '1,59 \$',
                            style: TextStyle(
                                color: gGreenColor,
                                fontFamily: gFontNunBlack,
                                fontSize: 24.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Основная колода игры с крутыми заданиями',
                        style: TextStyle(
                          color: gMainColor.withOpacity(0.5),
                          fontSize: 14.0,
                          fontFamily: gFontRobReg,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Пробная ",
                          style: TextStyle(color: Color(0xFF808080)),
                          children: <TextSpan>[
                            TextSpan(
                              text: "– 15 карт",
                              style: TextStyle(
                                color: gMainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Полная ",
                          style: TextStyle(color: Color(0xFF808080)),
                          children: <TextSpan>[
                            TextSpan(
                              text: "– 60 карт ",
                              style: TextStyle(
                                color: gMainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "+ отключение рекламы на месяц",
                        style: TextStyle(
                            color: gMainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: gOrangeColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: gOrangeColor,
                ),
                child: Text(
                  'Приобрести'.toUpperCase(),
                  style: const TextStyle(
                    color: gWhiteColor,
                    fontFamily: gFontNunBold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Промо-код:',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: gFontRobReg,
                color: gMainColor,
              ),
            ),
            const SizedBox(height: 5.0,),
            CustomInput(onChanged: null,width: double.infinity,)
          ],
        )
      ],
    );
  }
}

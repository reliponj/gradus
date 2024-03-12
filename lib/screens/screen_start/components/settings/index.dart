import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/components/modal_wrapper.dart';
import 'package:gradus/helpers/languages.dart';
import 'package:gradus/screens/screen_start/index.dart';
import 'package:gradus/states.dart';

import '../../../../constants.dart';
import 'components/divider_custom.dart';
import 'components/switcher_custom.dart';

const List<String> list = <String>['ua', 'en'];

Map<String, String> langCode() => {
      'ua': 'assets/icons/flag-ua.svg',
      'en': 'assets/icons/flag-en.svg',
    };

class SettingsWindow extends StatefulWidget {
  const SettingsWindow({
    super.key,
    this.onPressed,
  });

  final dynamic onPressed;

  @override
  State<SettingsWindow> createState() => _SettingsWindowState();
}

class _SettingsWindowState extends State<SettingsWindow> {
  String dropdownValue = languageCode;

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      innerWidget: [
        Text(
          language.isEmpty ? '' : language['settings'],
          style: const TextStyle(
            color: gMainColor,
            fontSize: 16.0,
            fontFamily: gFontNunBold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Звук',
              style: TextStyle(
                color: gMainColor,
                fontFamily: gFontRobReg,
                fontSize: 16.0,
              ),
            ),
            SwitchCustom(
              onSwitched: (val) {
                setState(() {
                  isTurnVolume = val;
                });
              },
              switchedValue: isTurnVolume
            )
          ],
        ),
        const DividerCustom(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Автоперемешивание \nкарт',
              style: TextStyle(
                color: gMainColor,
                fontFamily: gFontRobReg,
                fontSize: 16.0,
              ),
            ),
            SwitchCustom(
                onSwitched: (val) {
                  setState(() {
                    isTurnAutoShuffling = val;
                  });
                },
                switchedValue: isTurnAutoShuffling
            )
          ],
        ),
        const DividerCustom(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Язык",
              style: TextStyle(
                color: gMainColor,
                fontFamily: gFontRobReg,
                fontSize: 16.0,
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: gMainColor,
              ),
              style: const TextStyle(color: gMainColor),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  languageCode = value;
                  lang();
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const ScreenMain(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SvgPicture.asset(langCode()[value]!),
                );
              }).toList(),
            )
          ],
        ),
      ],
      onPressed: widget.onPressed,
    );
  }
}

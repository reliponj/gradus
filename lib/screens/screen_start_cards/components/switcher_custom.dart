import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../constants.dart';

class SwitchCustom extends StatefulWidget {
  const SwitchCustom({
    super.key,
    required this.deckIsActive,
    required this.deckIsActiveFunc,
  });

  final bool deckIsActive;
  final deckIsActiveFunc;

  @override
  State<SwitchCustom> createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  // bool light0 = deckIsActive;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: widget.deckIsActive,
      width: 47.0,
      height: 26.0,
      toggleSize: 20.0,
      borderRadius: 30.0,
      padding: 2.0,
      toggleColor: gWhiteColor,
      switchBorder: Border.all(
        color: Color(0xFFE6EFE9),
        width: 1.0,
      ),
      activeColor: gGreenColor,
      inactiveColor: Color(0xFFCCCCCC),
      onToggle: widget.deckIsActiveFunc,
    );
  }
}

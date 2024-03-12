import 'package:flutter/material.dart';
import 'package:gradus/components/modal_wrapper.dart';

import '../../../constants.dart';

class ModalQuestion extends StatefulWidget {
  const ModalQuestion({Key? key, required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  State<ModalQuestion> createState() => _ModalQuestionState();
}

class _ModalQuestionState extends State<ModalQuestion> {
  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      onPressed: widget.onPressed,
      innerWidget: const <Widget>[
        Text(
          'Для активации данной колоды необходимо ввести промо-код, который можно найти в печатной версии игры',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: gMainColor,
            fontSize: 16.0,
            fontFamily: gFontNunBold,
          ),
        )
      ],
    );
  }
}

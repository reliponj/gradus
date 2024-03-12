import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/constants.dart';

class ModalWrapper extends StatelessWidget {
  const ModalWrapper({Key? key, this.onPressed, required this.innerWidget})
      : super(key: key);

  final dynamic onPressed;
  final List<Widget> innerWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.transparent,
            padding: EdgeInsets.zero
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: gMainColor.withOpacity(0.5),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: gWhiteColor, borderRadius: BorderRadius.circular(10.0)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(children: innerWidget),
                  Positioned(
                    top: -80.0,
                    right: -30.0,
                    child: TextButton(
                      style: TextButton.styleFrom(foregroundColor: gMainColor),
                      onPressed: onPressed,
                      child: SvgPicture.asset('assets/icons/close.svg'),
                      // child: Icon(Icons.confirmation_num_sharp, color: gMainColor,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

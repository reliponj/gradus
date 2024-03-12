import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/screens/screen_start/index.dart';
import 'package:gradus/states.dart';

class WrapperScreens extends StatelessWidget {
  const WrapperScreens({Key? key, this.child}) : super(key: key);

  final child;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 2000.0,
              minWidth: 2000.0,
            ),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Image.asset(
                  'assets/images/CORNERS.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: child,
        )
      ],
    );
  }
}

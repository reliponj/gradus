import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Divider(
        height: 1.0,
        color: Color(0xFFEEEEEE),
      ),
    );
  }
}

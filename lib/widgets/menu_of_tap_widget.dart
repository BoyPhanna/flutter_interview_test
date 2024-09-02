import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuOfTapWidget extends StatelessWidget {
  String title;
  Function onTap;
  IconData icon = Icons.verified;
  double width = 100.h;
  double height = 50.h;
  MenuOfTapWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Icons.verified,
    this.width = 100,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.black,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder()),
        onPressed: () {
          onTap();
        },
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Tab(
            icon: Icon(icon),
            text: "${title}",
          ),
        ),
      ),
    );
  }
}

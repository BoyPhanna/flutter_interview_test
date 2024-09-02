// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideBarMenuWidget extends StatelessWidget {
  String title;
  IconData icon;
  Function onTap;
  SideBarMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconColor: Colors.blue,
          disabledForegroundColor: Colors.black,
          shape: RoundedRectangleBorder()),
      onPressed: () {
        // print("Tap side bar ${title}");
        onTap();
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10.h,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}

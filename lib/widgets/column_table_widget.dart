import 'package:flutter/material.dart';

class ColumnTableWidget extends StatelessWidget {
  double width;
  String title;
  ColumnTableWidget({
    super.key,
    required this.width,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

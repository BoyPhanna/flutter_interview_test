import 'package:flutter/material.dart';

class ColumnHeaderWidget extends StatelessWidget {
  double width;
  String title;
  ColumnHeaderWidget({
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
        color: Colors.black12,
        border: Border(
          bottom: BorderSide(color: Colors.black45),
          left: BorderSide(color: Colors.black45),
          right: BorderSide(color: Colors.black45),
          top: BorderSide(color: Colors.black45),
        ),
      ),
      child: Text(title),
    );
  }
}

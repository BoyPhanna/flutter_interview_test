import 'package:flutter/material.dart';

class ColumnBodyWidget extends StatelessWidget {
  double width;

  Widget child;
  Color color;
  ColumnBodyWidget({
    super.key,
    required this.width,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        // border: Border(
        //   bottom: BorderSide(color: Colors.black45),
        //   left: BorderSide(color: Colors.black45),
        //   right: BorderSide(color: Colors.black45),
        //   top: BorderSide(color: Colors.black45),
        // ),
      ),
      child: child,
    );
  }
}

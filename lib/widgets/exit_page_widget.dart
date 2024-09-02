import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ExitPageWidget extends StatefulWidget {
  const ExitPageWidget({super.key});

  @override
  State<ExitPageWidget> createState() => _ExitPageWidgetState();
}

class _ExitPageWidgetState extends State<ExitPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lottie animation as the background
          Positioned.fill(
            child: Lottie.asset(
              'assets/lotties/bg.json',
              fit: BoxFit.cover,
            ),
          ),
          // Other content on top
          Center(
            child: BounceInDown(
              duration: Duration(seconds: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/Tonaire Digital.png"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: "តើអ្នកចង់ចាកចេញពីកម្មវិធីមែនទេ?",
                          confirmBtnText: "ចង់ចាកចេញ",
                          cancelBtnText: "មិនចង់ចាកចេញ",
                          onConfirmBtnTap: () => exit(0),
                        );
                      },
                      child: Text(
                        "ចាកចេញពីកម្មវិធី",
                        style: TextStyle(fontSize: 16.sp),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

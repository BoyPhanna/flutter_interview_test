import 'package:animate_do/animate_do.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:interview_test/controllers/controller.dart';
import 'package:lottie/lottie.dart';

class EmptyPageWidget extends StatefulWidget {
  const EmptyPageWidget({super.key});

  @override
  State<EmptyPageWidget> createState() => _EmptyPageWidgetState();
}

class _EmptyPageWidgetState extends State<EmptyPageWidget> {
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

          Positioned(
            left: 10.h,
            top: 10.h,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    fetureController.isMusic.value =
                        !fetureController.isMusic.value;
                    if (fetureController.isMusic.value) {
                      FlameAudio.bgm.resume();
                    } else {
                      FlameAudio.bgm.pause();
                    }
                  },
                  child: Obx(
                    () => Text(fetureController.isMusic.value
                        ? "បិទចម្រៀង"
                        : "បើកចម្រៀង"),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    fetureController.changeMusic();
                  },
                  child: Text("ដូរបទចម្រៀង"),
                ),
              ],
            ),
          ),
          Center(
            child: FadeIn(
              duration: Duration(seconds: 2),
              child: Image(
                image: AssetImage("assets/images/Tonaire Digital.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

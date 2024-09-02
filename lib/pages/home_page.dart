import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:interview_test/controllers/controller.dart';
import 'package:interview_test/pages/process_page.dart';
import 'package:interview_test/widgets/empty_page_widget.dart';
import 'package:interview_test/widgets/exit_page_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = Random().nextInt(4) + 1;
  @override
  void initState() {
    manageInvoiceController.init();
    manageInvoiceController.choseAreas.clear();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("music${number}.mp3");
    Future.delayed(Duration(milliseconds: 1000), () {
      FlameAudio.bgm.pause();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    FlameAudio.bgm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.person_2),
                  text: 'ការគ្រប់គ្រងអ្នកប្រើប្រាស់'),
              Tab(icon: Icon(Icons.inbox), text: 'ប្រតិបត្ដិការ'),
              Tab(icon: Icon(Icons.info), text: 'ផ្សេងៗ'),
              Tab(icon: Icon(Icons.logout), text: 'ចេញពីកម្មវិធី'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EmptyPageWidget(),
            ProcessPage(),
            EmptyPageWidget(),
            ExitPageWidget(),
          ],
        ),
      ),
    );
  }
}

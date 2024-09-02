import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:get/get.dart';

class FetureControllerNave extends GetxController {
  RxString feture = "abc".obs;
  RxBool isMusic = false.obs;
  RxString menu = "".obs;
  void changeMusic() {
    int number = Random().nextInt(4) + 1;
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("music${number}.mp3");
  }
}

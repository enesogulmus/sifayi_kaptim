import 'package:hive_flutter/hive_flutter.dart';

class IntroShown {
  var box = Hive.box("booleans");

  bool getIntroScreen() {
    bool shown = box.get("introShown", defaultValue: false);
    return shown;
  }

  setIntroScreen() {
    box.put("introShown", true);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sifayi_kaptim/db/intro_shown.dart';
import 'package:sifayi_kaptim/introduction/intro.dart';
import 'package:sifayi_kaptim/personal_information.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('booleans');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(const MyApp());
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isIntroShown;

  bool showingFirstTime() {
    return IntroShown().getIntroScreen();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //introscreen kontrolü için değişkeni dolduran metot
    _isIntroShown = showingFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isIntroShown ? const PersonalInformation() : const Intro(),
    );
  }
}

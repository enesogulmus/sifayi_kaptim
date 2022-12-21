import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackGroundColor(),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}

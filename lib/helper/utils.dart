import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class Utils {
  errorSnackBar({required String mesaj, required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            mesaj,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    });
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }

  successSnackBar({required String mesaj, required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            mesaj,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(53, 176, 201, 1),
        ),
      );
    });
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }

  infoSnackBar({required String mesaj, required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText(
            text: mesaj,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            textColor: context.primaryTextColor(),
          ),
          backgroundColor: Colors.teal,
        ),
      );
    });
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }
}

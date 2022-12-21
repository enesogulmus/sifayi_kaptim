import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/components/bottom_sheet.dart';
import 'package:sifayi_kaptim/components/create_route.dart';
import 'package:sifayi_kaptim/components/custom_button.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/components/input_decoration.dart';
import 'package:sifayi_kaptim/components/keyboard_focus.dart';
import 'package:sifayi_kaptim/components/text_field.dart';
import 'package:sifayi_kaptim/components/text_style.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'package:sifayi_kaptim/generated/assets.dart';
import 'package:sifayi_kaptim/questions.dart';
import 'package:sifayi_kaptim/helper/utils.dart';
import 'package:sifayi_kaptim/helper/validator.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  ScrollController singleChildScrollView = ScrollController();
  late GlobalKey<FormState> _formKey;
  late List<String> yesNoList;
  late List<String> sexList;
  late String valueOfSex;
  late String valueOfPregnancy;
  late TextEditingController valueOfAge;
  late String valueOfMutual;
  late TextEditingController valueOfHeight;
  late TextEditingController valueOfWeight;
  late String valueOfSmoking;
  late String valueOfAlcohol;
  late String mutualTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey();
    sexList = ['Male', 'Female'];
    yesNoList = ['Yes', 'No'];
    valueOfSex = '';
    valueOfPregnancy = '';
    valueOfMutual = '';
    valueOfSmoking = '';
    valueOfAlcohol = '';
    mutualTitle = '';
    valueOfAge = TextEditingController();
    valueOfHeight = TextEditingController();
    valueOfWeight = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackGroundColor,
      body: KeyboardFocus.unFocus(
        child: SingleChildScrollView(
          controller: singleChildScrollView,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60,
                ),
                child: Image.asset(
                  Assets.svgLogo,
                  height: 78,
                ),
              ),
              const SizedBox(height: 10,),
              CustomText(
                text: 'Şifayı Kaptım',
                fontSize: 28,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                textColor: context.accentColor(),
              ),
              const SizedBox(height: 60,),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WrapTextFormField(
                      child: customTextFormField(
                        context,
                        hintText: 'Enter Age',
                        controller: valueOfAge,
                        validator: (value) {
                          if (value != null && value != '') {
                            if (int.parse(value) > 0 && int.parse(value) < 110) {
                              return null;
                            } else {
                              return 'You should a valid value(18-110)';
                            }
                          } else {
                            return 'The field cannot be left blank.';
                          }
                        },
                        onChanged: (p0) {
                          setState(() {});
                        },
                        inputType: TextInputType.number,
                        iconPath: Assets.svgAge,
                      ),
                    ),
                    WrapTextFormField(
                      child: customTextFormField(
                        context,
                        hintText: 'Enter Height',
                        controller: valueOfHeight,
                        validator: (value) {
                          if (value != null && value != '') {
                            if (int.parse(value) > 140 && int.parse(value) < 240) {
                              return null;
                            } else {
                              return 'You should a valid value(140-240cm)';
                            }
                          } else {
                            return 'The field cannot be left blank.';
                          }
                        },
                        inputType: TextInputType.number,
                        iconPath: Assets.svgHeight,
                      ),
                    ),
                    WrapTextFormField(
                      child: customTextFormField(
                        context,
                        hintText: 'Enter Weight',
                        controller: valueOfWeight,
                        validator: (value) {
                          if (value != null && value != '') {
                            if (int.parse(value) > 30 && int.parse(value) < 240) {
                              return null;
                            } else {
                              return 'You should a valid value(30-240kg)';
                            }
                          } else {
                            return 'The field cannot be left blank.';
                          }
                        },
                        inputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        iconPath: Assets.svgWeight,
                      ),
                    ),
                    CustomBottomSheet.withOutSearch(
                      myItemList: sexList,
                      title: 'Select Sex',
                      selectedText: (value) {
                        valueOfSex = value;
                        setState(() {
                          if (valueOfSex != 'Male') {
                            mutualTitle = 'Menopause';
                          } else {
                            mutualTitle = 'Andropause';
                          }
                        });
                      },
                      leadingPath: Assets.svgSex,
                    ),
                    Visibility(
                      visible: ((valueOfSex.isNotEmpty && valueOfSex != '') ? valueOfSex != 'Male' : false),
                      child: CustomBottomSheet.withOutSearch(
                        myItemList: yesNoList,
                        title: 'Select Pregnancy',
                        selectedText: (value) {
                          valueOfPregnancy = value;
                        },
                        leadingPath: Assets.svgPregnancy,
                      ),
                    ),
                    Visibility(
                      visible: ((valueOfSex.isNotEmpty)
                          ? (valueOfAge.text.isNotEmpty && valueOfAge.text != '')
                              ? (int.parse(valueOfAge.text) >= 40)
                              : false
                          : false),
                      child: CustomBottomSheet.withOutSearch(
                        myItemList: yesNoList,
                        title: 'Select $mutualTitle',
                        selectedText: (value) {
                          valueOfMutual = value;
                        },
                        leadingPath: Assets.svgAndropause,
                      ),
                    ),
                    CustomBottomSheet.withOutSearch(
                      myItemList: yesNoList,
                      title: 'Select Smoking',
                      selectedText: (value) {
                        valueOfSmoking = value;
                      },
                      leadingPath: Assets.svgYesSmoking,
                    ),
                    CustomBottomSheet.withOutSearch(
                      myItemList: yesNoList,
                      title: 'Select Alcohol',
                      selectedText: (value) {
                        valueOfAlcohol = value;
                      },
                      leadingPath: Assets.svgYesAlcohol,
                    ),
                    Button(
                      color: CustomColors.accentColor,
                      textColor: CustomColors.primaryColor,
                      text: 'I confirm',
                      hasBorder: false,
                      action: () {
                        pushGeneralSympthoms();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customTextFormField(
    BuildContext context, {
    required TextInputType inputType,
    required String hintText,
    required TextEditingController controller,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputAction? textInputAction,
    String? iconPath,
    String? suffixIconPath,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      style: customTextStyle(context),
      cursorColor: context.accentColor(),
      cursorRadius: CustomDecorations.radius,
      keyboardType: inputType,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: customInputDecoration(
        context,
        iconPath: iconPath,
        hintText: hintText,
        suffixIconPath: suffixIconPath,
      ),
    );
  }

  void calculationOfBodyIndex({required int weight, required int height}) {
    double index = weight / height * height;
    if (index >= 30) {
      Diseases.obesity++;
      Diseases.diabetes++;
      Diseases.hypertension++;
      Diseases.cancer++;
      Diseases.cholesterol++;
      Diseases.calcification++;
      Diseases.herniatedDisc++;
      Diseases.ulcer++;
      Diseases.heartDisease++;
      Diseases.lungDisease++;
    }
  }

  void calculationOfPosibility() {
    if (valueOfPregnancy != 'No') {
      Diseases.herniatedDisc++;
      Diseases.calcification++;
    }
    if (int.parse(valueOfAge.text) >= 40) {
      Diseases.hypertension++;
      Diseases.heartDisease++;
    }
    if (valueOfMutual != 'No') {
      Diseases.diabetes++;
      Diseases.hypertension++;
      Diseases.cancer++;
      Diseases.cholesterol++;
      Diseases.calcification++;
      Diseases.herniatedDisc++;
      Diseases.ulcer++;
      Diseases.heartDisease++;
      Diseases.lungDisease++;
    }
    if (valueOfWeight.text.isNotEmpty && valueOfHeight.text.isNotEmpty) {
      calculationOfBodyIndex(height: int.parse(valueOfHeight.text), weight: int.parse(valueOfWeight.text));
    }
    if (valueOfSmoking != 'No') {
      Diseases.cancer++;
      Diseases.lungDisease++;
      Diseases.hypertension++;
      Diseases.heartDisease++;
      Diseases.ulcer++;
      Diseases.herniatedDisc++;
    }
    if (valueOfAlcohol != 'No') {
      Diseases.cancer++;
      Diseases.hypertension++;
      Diseases.heartDisease++;
      Diseases.ulcer++;
      Diseases.cholesterol++;
    }
  }

  void pushGeneralSympthoms() {
    bool isValid = false;
    if (_formKey.currentState!.validate()) {
      isValid = true;
      if (Validator.isNull(valueOfSex) != null) {
        isValid = false;
        Utils().infoSnackBar(mesaj: 'The sex field cannot be left blank.', context: context);
      } else {
        isValid = true;
      }
      if (Validator.isNull(valueOfSex) != null) {
        if (valueOfSex != 'Male') {
          if (Validator.isNull(valueOfPregnancy) != null) {
            isValid = false;
            Utils().infoSnackBar(mesaj: 'The pregnancy field cannot be left blank.', context: context);
          } else {
            isValid = true;
          }
        }
      }
      if (int.parse(valueOfAge.text) >= 40) {
        if (Validator.isNull(valueOfMutual) != null) {
          isValid = false;
          Utils().infoSnackBar(
              mesaj: valueOfSex != 'Male'
                  ? 'The menopause field cannot be left blank.'
                  : 'The andropause field cannot be left blank.',
              context: context);
        } else {
          isValid = true;
        }
      }
      if (Validator.isNull(valueOfSmoking) != null) {
        isValid = false;
        Utils().infoSnackBar(mesaj: 'The smoking field cannot be left blank.', context: context);
      } else {
        isValid = true;
      }
      if (Validator.isNull(valueOfAlcohol) != null) {
        isValid = false;
        Utils().infoSnackBar(mesaj: 'The alcohol field cannot be left blank.', context: context);
      } else {
        isValid = true;
      }
    } else {
      isValid = false;
    }
    if (isValid) {
      calculationOfPosibility();
      Navigator.of(context).push(
        createRoute(
          routePage: const Questions(),
        ),
      );
    }
  }
}

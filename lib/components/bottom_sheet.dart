import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/components/slide_in_up.dart';
import 'package:sifayi_kaptim/components/text_style.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'package:sifayi_kaptim/generated/assets.dart';

class CustomBottomSheet extends StatefulWidget {
  final List<String> myItemList;
  final String title;
  final Function(String value) selectedText;
  late bool isSearch;
  final String? leadingPath;
  final int? selectedIndex;
  late bool willCleaned;

  CustomBottomSheet.withSearch({
    Key? key,
    required this.myItemList,
    required this.title,
    required this.selectedText,
    this.leadingPath,
    this.selectedIndex = 0,
    this.willCleaned = false,
  }) : super(key: key) {
    isSearch = true;
  }

  CustomBottomSheet.withOutSearch({
    Key? key,
    required this.myItemList,
    required this.title,
    required this.selectedText,
    this.leadingPath,
    this.selectedIndex = 0,
    this.willCleaned = false,
  }) : super(key: key) {
    isSearch = false;
  }

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late TextEditingController myTextField;
  late List<String> helperList;
  late String selectedText;

  @override
  void initState() {
    super.initState();
    myTextField = TextEditingController();
    helperList = [];
    selectedText = "";
    clean(widget.willCleaned);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myTextField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    clean(widget.willCleaned);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          elevation: 0,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return AnimatedContainer(
              height: MediaQuery.of(context).viewInsets.bottom > 0
                  ? height * .75
                  : height * .5,
              /*        klavye dinlenir. Klavye açıldığında itemler klavyenin altında
              kalmaması için bottomSheet boyutu yükseltilir.*/
              duration: const Duration(milliseconds: 200),
              child: StatefulBuilder(
                builder: (context, setState2) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 2 + 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    decoration: BoxDecoration(
                      color: context.scaffoldBackGroundColor(),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 45,
                              height: 3,
                              decoration: BoxDecoration(
                                color: context.primaryTextColor(),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        widget.isSearch == true
                            ? Container(
                                height: 54,
                                decoration: BoxDecoration(
                                  color: context.primaryColor(),
                                  borderRadius:
                                      CustomDecorations.borderRadiusGeometry,
                                ),
                                child: TextField(
                                  controller: myTextField,
                                  onChanged: (value) {
                                    setState2(() {
                                      helperList.clear();
                                      for (int i = 0;
                                          i < widget.myItemList.length;
                                          i++) {
                                        /*  if (widget.myItemList[i].contains(
                                    myTextField.text.toUpperCase(),
                                  )) {
                                    helperList.add(widget.myItemList[i]);
                                  }*/
                                        if (widget.myItemList[i]
                                            .toLowerCase()
                                            .contains(
                                              myTextField.text.toLowerCase(),
                                            )) {
                                          helperList.add(widget.myItemList[i]);
                                        }
                                      }
                                    });
                                  },
                                  style: customTextStyle(context),
                                  cursorColor: context.primaryColor(),
                                  cursorRadius: const Radius.circular(10),
                                  decoration: InputDecoration(
                                    labelText: widget.title,
                                    border: InputBorder.none,
                                    suffixIcon: SvgPicture.asset(
                                      Assets.svgIconSearch,
                                      color: context.accentColor(),
                                    ),
                                    labelStyle: customTextStyle(context),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: helperList.isEmpty
                                ? widget.myItemList.length
                                : helperList.length,
                            itemBuilder: (context, index) {
                              String txt = helperList.isEmpty
                                  ? widget.myItemList[index]
                                  : helperList[index];
                              return SlideInUp(
                                duration: const Duration(milliseconds: 300),
                                from: 1000,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedText = txt;
                                        widget.selectedText(selectedText);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: context.accentColor(),),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: CustomText(
                                        fontSize: 16,
                                        text: txt,
                                        textColor: context.accentColor(),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: context.primaryColor(),
          borderRadius: BorderRadius.circular(10),
          //boxShadow: Constants.straightPopupShadow,
        ),
        child: Row(
          children: [
            (widget.leadingPath!.isNotEmpty)
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 5,
                      top: 9,
                      bottom: 9,
                    ),
                    child: SvgPicture.asset(
                      widget.leadingPath!,
                      color: context.accentColor(),
                    ),
                  )
                : const SizedBox(),
            CustomText(
              text: selectedText.isEmpty ? widget.title : selectedText,
              fontSize: 16,
              textColor: selectedText.isEmpty
                  ? context.passiveTextColor()
                  : context.primaryTextColor(),
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  Assets.svgIconDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clean(bool willCleaned) {
    if (willCleaned) {
      setState(() {
        selectedText = '';
      });
      widget.willCleaned = false;
    }
  }
}

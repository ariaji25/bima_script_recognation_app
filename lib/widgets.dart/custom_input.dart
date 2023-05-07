import 'package:bima_apps/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String label;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool obsecureText;
  final bool cek;
  final bool cekArray;
  List<dynamic>? value = ['Laki-Laki'];
  final TextInputType textInputType;
  // ignore: prefer_typing_uninitialized_variables
  final maxLines;

  CustomInput({
    Key? key,
    this.obsecureText = false,
    this.margin = EdgeInsets.zero,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.cek,
    required this.cekArray,
    this.value,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'inter',
            ),
          ),
          const SizedBox(height: 4),
          (cek == true)
              ? Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff3f3f4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller:
                          controller, //editing controller of this TextField
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'YYYY-MM-DD',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ), //icon of text field
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                1960), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          // setState(() {
                          controller.text = formattedDate;
                          // });
                        } else {}
                      },
                    ),
                  ),
                )
              : TextField(
                  keyboardType: textInputType,
                  obscureText: obsecureText,
                  controller: controller,
                  autofocus: false,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    prefixIconConstraints: (prefixIcon == null)
                        ? const BoxConstraints(minHeight: 20, minWidth: 20)
                        : const BoxConstraints(minHeight: 48, minWidth: 48),
                    suffixIconConstraints: (suffixIcon == null)
                        ? const BoxConstraints(
                            minHeight: 0,
                            minWidth: 0,
                            maxHeight: 0,
                            maxWidth: 0)
                        : const BoxConstraints(minHeight: 48, minWidth: 48),
                    hintText: hint,
                    prefixIcon: prefixIcon ?? const SizedBox(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.gray.toColor(), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.gray.toColor(), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: suffixIcon ?? const SizedBox(),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
        ],
      ),
    );
  }
}

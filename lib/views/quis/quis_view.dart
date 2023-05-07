import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/views/quis/quis_view_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class QuisView extends GetView<QuisViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
            margin:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Obx(() {
              if (controller.page.value < 0) {
                return const Text("Error");
              }
              if (controller.isLoading.value) {
                return Container();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(controller
                                    .quis.value[controller.page.value].text),
                                fit: BoxFit.fill))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  for (int i = 0; i < 4; i++)
                    GestureDetector(
                      child: Column(
                        children: [
                          Obx(() {
                            return OptionWidget(
                              onTap: () {
                                controller.quis.value[controller.page.value]
                                        .solution =
                                    controller.quis.value[controller.page.value]
                                        .options[i].code;
                                controller.reload();
                              },
                              option: controller
                                  .quis.value[controller.page.value].options[i],
                              optionColor: Colors.white,
                              controller: controller,
                              isLoading: controller.isLoading1.value,
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonSecondary(
                        text: "Prev",
                        controller: controller,
                        onPressed: () {
                          print(controller.page.value);
                          if (controller.page.value > 0) {
                            controller.page.value = controller.page.value - 1;
                          }
                        },
                        width: 118,
                      ),
                      ButtonSecondary(
                        text: "next",
                        controller: controller,
                        onPressed: () {
                          controller.page.value = controller.page.value + 1;
                        },
                        width: 118,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  (controller.page >= 19)
                      ? ButtonSecondary(
                          text: "Submit",
                          controller: controller,
                          onPressed: () {
                            controller.storeQuis();
                          },
                          width: MediaQuery.of(context).size.width,
                        )
                      : Container(),
                ],
              );
            })),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Option option;
  final VoidCallback onTap;
  final Color optionColor;
  final QuisViewModel controller;

  const OptionWidget(
      {Key? key,
      required this.option,
      required this.onTap,
      required this.optionColor,
      required this.controller,
      required bool isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: (controller.quis.value[controller.page.value].solution ==
                  option.code)
              ? Colors.blue[300]
              : optionColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 3),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: (controller.quis.value[controller.page.value].solution ==
                option.code)
            ? Text(option.text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
            : Text(
                option.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}

class ButtonSecondary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final QuisViewModel controller;

  const ButtonSecondary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 46,
    this.color = Colors.blue,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color ?? Colors.blue, width: 1.5),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: (text == "Prev")
            ? (controller.page < 0)
                ? () {}
                : onPressed
            : (text == "Submit")
                ? onPressed
                : (controller.page >= 19)
                    ? () {}
                    : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: (text == "Submit") ? Colors.red[700] : Colors.white,
          onPrimary: (text == "Prev")
              ? (controller.page <= 0)
                  ? color
                  : Colors.black
              : (text == "Submit")
                  ? Colors.white
                  : (controller.page >= 19)
                      ? color
                      : Colors.black,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/routes/app_pages.dart';
import 'package:bima_apps/views/rangking/rangking_view_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RangkingView extends GetView<RangkingViewModel> {
  int i = 0;
  // ignore: non_constant_identifier_names
  Color my = Colors.brown, CheckMyColor = Colors.white;

  RangkingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var r = const TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            body: Container(
          margin: const EdgeInsets.only(top: 65.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                child: RichText(
                    text: const TextSpan(
                        text: "Leader",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: " Board",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Global Rank Board: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(child: Obx(() {
                // ignore: unrelated_type_equality_checks
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: controller.history.value.length,
                      itemBuilder: (context, index) {
                        if (index >= 1) {
                          if (controller.history.value[index].point ==
                              controller.history.value[index - 1].point) {
                          } else {
                            i++;
                          }
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: i == 0
                                          ? Colors.amber
                                          : i == 1
                                              ? Colors.grey
                                              : i == 2
                                                  ? Colors.brown
                                                  : Colors.white,
                                      width: 3.0,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(5.0)),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 15.0),
                                        child: Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                                child: Container(
                                                    decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                                                            fit:
                                                                BoxFit.fill)))),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  controller.history
                                                      .value[index].name,
                                                  style: const TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 6,
                                                )),
                                            Text(
                                                "Points: ${controller.history.value[index].point}"),
                                          ],
                                        ),
                                      ),
                                      Flexible(child: Container()),
                                      i == 0
                                          ? Text("🥇", style: r)
                                          : i == 1
                                              ? Text(
                                                  "🥈",
                                                  style: r,
                                                )
                                              : i == 2
                                                  ? Text(
                                                      "🥉",
                                                      style: r,
                                                    )
                                                  : const Text(''),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
              })),
              Center(
                child: SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Get.toNamed(Routes.MULAIQUIZ);
                    },
                    color: Colors.deepPurple,
                    child: const Text(
                      "Mulai Quis",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}

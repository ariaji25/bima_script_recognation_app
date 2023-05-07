import 'package:bima_apps/widgets.dart/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/models.dart';

class HomeNewView extends GetView {
  const HomeNewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          margin:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Mari ',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xfff85e7d),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Berkenalan Dengan Aksara Bima!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffa9a4a5),
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                itemCount: cardDetailList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListCard(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bima_apps/views/aksara/aksara_view_model.dart';
import 'package:bima_apps/widgets.dart/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/models.dart';

class AksaraView extends GetView<AksaraViewModel> {
  const AksaraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Aksara Bima")),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(controller.aksara.length, (index) {
              return Center(
                child: AksaraItem(aksara: controller.aksara[index]),
              );
            }),
          ),
        ));
  }
}

class AksaraItem extends StatelessWidget {
  final Aksara aksara;

  const AksaraItem({
    Key? key,
    required this.aksara,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue[200],
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Image.asset(
                  aksara.image,
                  scale: 1,
                )),
                Text(
                  aksara.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                )
              ]),
        ));
  }
}

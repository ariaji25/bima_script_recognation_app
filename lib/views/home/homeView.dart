import 'dart:ffi';

import 'package:bima_apps/data/remote/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';

class HomeView extends GetView {
  HomeView({super.key});

  final DrawingController _drawingController = DrawingController(
      config: DrawConfig(
          color: Colors.black,
          contentType: StringBuffer,
          strokeWidth: 10.0,
          style: PaintingStyle.stroke));

  Widget drawBoard(BuildContext context) {
    return DrawingBoard(
      background: Container(width: 400, height: 400, color: Colors.white),
      showDefaultActions: false,
      showDefaultTools: false,
      controller: _drawingController,
    );
  }

  void onTooltipClicked(int index) {
    switch (index) {
      case 0:
        _drawingController.undo();
        break;
      case 1:
        _drawingController.redo();
        break;
      case 2:
        _drawingController.clear();
        break;
      case 3:
        _drawingController.getImageData().then((value) => {
              if (value != null)
                {
                  RemoteServices()
                      .predictImage(value.buffer.asUint8List())
                      .then((value) => {
                            Get.showSnackbar(GetSnackBar(
                              title: "Predic Result",
                              message:
                                  "Your bima script drawing recognaized as `${value.data?.predictResult}`",
                              duration: Duration(seconds: 3),
                            ))
                          })
                }
            });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bima App")),
      body: drawBoard(context),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        onTap: onTooltipClicked,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.undo),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redo),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Selesai",
          ),
        ],
      ),
    );
  }
}

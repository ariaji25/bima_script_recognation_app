import 'package:bima_apps/routes/app_pages.dart';
import 'package:bima_apps/views/score/score_view_model.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class ScoreView extends GetView<ScoreViewModel> {
  const ScoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            Column(
              children: [
                const Spacer(flex: 3),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.amber),
                ),
                Spacer(),
                Text(
                  controller.point.point,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.amber),
                ),
                Spacer(flex: 3),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {
                        Get.toNamed(Routes.HOME);
                      },
                      color: Colors.deepPurple,
                      child: const Text(
                        "Kembali di home",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

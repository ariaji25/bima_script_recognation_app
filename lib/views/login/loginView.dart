import 'package:bima_apps/style/theme.dart';
import 'package:bima_apps/views/login/loginViewModel.dart';
import 'package:bima_apps/widgets.dart/custom_input.dart';
import 'package:bima_apps/widgets.dart/widgets.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  Widget _submitButton(context) {
    return GestureDetector(
      onTap: () {
        print(controller.usernameC.text);
        if (controller.usernameC.text.isEmpty) {
          CustomAlert.show(
            title: 'Username',
            cek: false,
            description: "Username Tidak boleh kosong!",
            onTap: () {},
          );
          return;
        }
        if (controller.passwordC.text.length < 7) {
          CustomAlert.show(
            title: 'Password',
            cek: false,
            description: "password  minimal 8 karakter!",
            onTap: () {},
          );
          return;
        }

        controller.login();
        CustomAlert.showLoaderDialog(context);

        // print("object");
        Future.delayed(const Duration(milliseconds: 5000), () {
          if (controller.isLoading.value == false) {
            if (controller.user.statusCode == 200) {
              Navigator.pop(context);

              Get.toNamed('/home');
            } else {
              Navigator.pop(context);

              CustomAlert.show(
                cek: true,
                title: 'Login Gagal',
                description: controller.user.message,
                onTap: () {},
              );
            }
            return;
          } else {
            Navigator.pop(context);

            CustomAlert.show(
              cek: true,
              title: 'Login Gagal',
              description: controller.user.message,
              onTap: () {},
            );
            return;
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue, Colors.blue])),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Ak',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.blue),
          children: [
            TextSpan(
              text: 'sa',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'ra',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        CustomInput(
          controller: controller.usernameC,
          label: 'Email*',
          hint: 'Masukkan Email',
          cek: false,
          cekArray: false,
          prefixIcon: Icon(Icons.person, color: AppColor.gray.toColor()),
          margin: const EdgeInsets.only(bottom: 16),
        ),
        Obx(() => CustomInput(
              controller: controller.passwordC,
              label: 'Password*',
              hint: '***********',
              cek: false,
              cekArray: false,
              obsecureText: controller.obsecureText.value,
              prefixIcon: Icon(Icons.lock, color: AppColor.gray.toColor()),
              suffixIcon: IconButton(
                icon: (controller.obsecureText.value != false)
                    ? Icon(Icons.visibility, color: AppColor.gray.toColor())
                    : Icon(Icons.visibility_off,
                        color: AppColor.gray.toColor()),
                onPressed: () {
                  controller.obsecureText.value =
                      !(controller.obsecureText.value);
                },
                color: AppColor.gray.toColor(),
              ),
              margin: const EdgeInsets.only(bottom: 0),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        // ignore: sized_box_for_whitespace
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  const SizedBox(height: 50),
                  _emailPasswordWidget(),
                  const SizedBox(height: 20),
                  _submitButton(context),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: const Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: height * .055),
                ],
              ),
            ),
          ),
          // Positioned(top: 40, left: 0, child: _backButton(context)),
        ],
      ),
    ));
  }
}

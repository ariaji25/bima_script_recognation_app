part of '../widgets.dart';

class CustomAlert {
  static show({
    required String title,
    String? description,
    bool cek = false,
    required void Function()? onTap,
  }) {
    Get.defaultDialog(
      title: "",
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: const TextStyle(fontSize: 0),
      content: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close_sharp),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Container(
              width: 130,
              height: 130,
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: (cek)
                  // ignore: avoid_unnecessary_containers
                  ? Container(
                      child: const Icon(
                        Icons.close,
                        size: 60.0,
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      child: const Icon(
                        Icons.done,
                        size: 60.0,
                        color: Colors.white,
                      ),
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'inter',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              margin: const EdgeInsets.only(bottom: 64),
              child: Text(
                (description != null) ? description : '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.blue1,
                  fontFamily: 'inter',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

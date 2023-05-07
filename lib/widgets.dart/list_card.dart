part of 'widgets.dart';

class ListCard extends StatelessWidget {
  const ListCard(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          if (index == 2) {
            Get.toNamed(Routes.MENULIS);
          } else if (index == 1) {
            Get.toNamed(Routes.QUIZ);
          } else {
            Get.toNamed(Routes.AKSARA);
          }
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: cardDetailList[index].gradients,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 7,
                    spreadRadius: 5,
                    color: cardDetailList[index].shadowColor,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardDetailList[index].title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: cardDetailList[index].iconTag,
              child: Image.asset(
                cardDetailList[index].iconAssetName,
                scale: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

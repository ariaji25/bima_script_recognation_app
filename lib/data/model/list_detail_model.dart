part of 'models.dart';

class ListDetail {
  ListDetail(
      {required this.title,
      required this.iconAssetName,
      required this.gradients,
      required this.shadowColor,
      required this.iconTag,
      required this.category,
      required this.textColor});
  final String title;
  final String iconAssetName;
  final List<Color> gradients;
  final Color shadowColor;
  final Object iconTag;
  final String category;
  final Color textColor;
}

const double opacity = 0.4;

final List<ListDetail> cardDetailList = [
  ListDetail(
    title: 'Aksara Bima',
    iconAssetName: 'assets/images/history.png',
    gradients: [
      const Color(0xff1c0659),
      const Color(0xff3c2a70),
    ],
    shadowColor: const Color(0xff3c2a70).withOpacity(opacity),
    iconTag: 'history_icon',
    category: 'history',
    textColor: const Color(0xff3c2a70),
  ),
  ListDetail(
    title: 'Mari Bermain',
    iconAssetName: 'assets/images/music.png',
    gradients: [
      const Color(0xff28272b),
      const Color(0xff48474a),
    ],
    shadowColor: const Color(0xff48474a).withOpacity(opacity),
    iconTag: 'music_icon',
    category: 'music',
    textColor: const Color(0xff28272b),
  ),
  ListDetail(
    title: 'Menulis',
    iconAssetName: 'assets/images/science.png',
    gradients: [
      const Color(0xffeb2aeb),
      const Color(0xfffc7efc),
    ],
    shadowColor: const Color(0xfffc7efc).withOpacity(opacity),
    iconTag: 'science_icon',
    category: 'science',
    textColor: const Color(0xffeb2aeb),
  ),
];

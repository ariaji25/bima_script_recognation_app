import 'package:bima_apps/di/loginBinding.dart';
import 'package:bima_apps/di/quisBinding.dart';
import 'package:bima_apps/di/rangkingBinding.dart';
import 'package:bima_apps/di/homeBinding.dart';
import 'package:bima_apps/di/homeNewBinding.dart';
import 'package:bima_apps/di/scoreBinding.dart';
import 'package:bima_apps/views/home/homeView.dart';
import 'package:bima_apps/views/home_new/homeNewView.dart';
import 'package:bima_apps/views/login/loginView.dart';
import 'package:bima_apps/views/quis/quis_view.dart';
import 'package:bima_apps/views/rangking/rangking_view.dart';
import 'package:bima_apps/views/score/score_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const SPLASH_SCREEN = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeNewView(),
      binding: HomeNewBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.MENULIS,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => RangkingView(),
      binding: RangkingBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.MULAIQUIZ,
      page: () => QuisView(),
      binding: QuisBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.SCORE,
      page: () => ScoreView(),
      binding: ScoreBinding(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
  ];
}

import 'package:bima_apps/di/homeBinding.dart';
import 'package:bima_apps/views/home/homeView.dart';
import 'package:get/route_manager.dart';

List<GetPage> pages = [
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
  GetPage(name: "/", page: () => HomeView(), binding: HomeBinding()),
];

import 'dart:convert';

import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'auth_service.dart';
part 'history_service.dart';
part 'quis_service.dart';

String baseURL = 'https://stimasi.absensinow.id/api/v1';

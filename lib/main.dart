import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passport/locator.dart';
import 'package:passport/presentation/page/home.dart';
import 'package:passport/utils/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const GetMaterialApp(
    title: appTitle,
    home: HomePage(),
  ));
}

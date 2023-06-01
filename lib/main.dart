import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:netflix_clone_flutter/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Netflix Clone Flutter',
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}

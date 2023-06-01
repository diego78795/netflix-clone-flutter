import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00211f1f),
        body: GetBuilder<SplashController>(builder: (_) {
          return Stack(
            children: [
              AnimatedContainer(
                  onEnd: _.onEnd,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 1300),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: _.animatedMargin),
                  child: SizedBox(
                    width: _.findLogoSize(),
                    height: _.findLogoSize(),
                    child: Image.asset(
                      'assets/netflix_logo.png',
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                    ),
                  ))
            ],
          );
        }));
  }
}

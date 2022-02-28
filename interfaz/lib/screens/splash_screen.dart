import 'package:flutter/material.dart';
import 'package:interfaz/screens/Login.dart';
import 'package:interfaz/settings/settings_colors.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Login(),
      duration: 2000,
      imageSize: 130,
      imageSrc: "imagenes/logo_onepice.png",
      text: "Splash Screen",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 30,
      ),
      backgroundColor: SettingsColors.backColor,
    );
  }
}

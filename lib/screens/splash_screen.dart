import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/components/bottom_bar.dart';
import 'package:restaurant/functions/navigator_ext.dart';
import 'package:restaurant/loginPage/login_page.dart';
import 'package:restaurant/screens/base_scafold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final box = GetStorage();
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (box.read("token") != null) {
        pushAndPopBack(const BaseScaffold());
      } else {
        pushAndPopBack(const LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 16.0, end: 36),
          duration: Duration(seconds: 2),
          builder: (BuildContext context, double size, Widget? child) {
            return Text(
              'Hoşgeldiniz',
              style: TextStyle(fontSize: size, color: Colors.orange),
            );
          },
        ),
      ),
    );
  }
}

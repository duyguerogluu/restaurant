/*
 *  This file is part of restaurant.
 *
 *  restaurant is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  restaurant is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with restaurant.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/components/bottom_bar.dart';
import 'package:restaurant/functions/duygu_nav.dart';
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
    super.initState();
    init();
  }

  Future init() async => Future.delayed(
        const Duration(seconds: 3),
        () => DuyguNav.pushAndPopBack(const LoginPage()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 16.0, end: 36),
          duration: const Duration(seconds: 2),
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

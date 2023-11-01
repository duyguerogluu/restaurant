import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/screens/base_scafold.dart';
import 'package:restaurant/screens/food_detail_screen.dart';
import 'package:restaurant/screens/menu_screen_deneme.dart';
import 'package:restaurant/screens/serial_menu_deneme_screen.dart';
import 'package:restaurant/screens/main_menu_screen.dart';
import 'package:restaurant/screens/meal_details_screen.dart';
import 'package:restaurant/screens/menu_screen.dart';
import 'package:restaurant/screens/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MenuScreen(),
      //   '/fooddetail': (context) => FoodDetailScreen(),
      // },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

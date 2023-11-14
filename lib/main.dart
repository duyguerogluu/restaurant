import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/loginPage/login_page.dart';
import 'package:restaurant/screens/base_scafold.dart';
import 'package:restaurant/screens/offer_screen.dart';
import 'package:restaurant/screens/splash_screen.dart';

import 'functions/duygu_nav.dart';
import 'models/menu_by_category_model.dart';
import 'screens/food_detail_screen.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final basketList = <MenuByCategoryModel>[];

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      navigatorKey: DuyguNav.navigatorKey,
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MenuScreen(),
        '/offer': (context) => const OfferScreen(),
        '/fooddetail': (context) => const FoodDetailScreen(
              index: 0,
            ),
      },
      title: 'restaurants',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

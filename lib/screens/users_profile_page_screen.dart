import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/loginPage/login_page.dart';
import 'package:restaurant/models/signup_model.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';
import 'package:restaurant/riverpod/signup_riverpod.dart';
import 'package:restaurant/screens/user_setting_screen.dart';

class UserProfilePageScreen extends ConsumerWidget {
  const UserProfilePageScreen({Key? key}) : super(key: key);

  String getText(TextEditingController controller, String def) {
    if (controller.text.trim().isEmpty) {
      return def;
    }

    return controller.text;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var model = ref.read(signup);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage:
                  NetworkImage("https://i.stack.imgur.com/l60Hf.png"),
            ),
            SizedBox(height: 20.0),
            Text(
              getText(model.adi, 'Kullanıcı Adı'),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              getText(model.email,
                  'kullanici_adi@mail.com'), // Kullanıcı e-posta adresi
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            SizedBox(height: 30.0),
            // ListTile(
            //   leading: Icon(Icons.credit_card), // Kredi kartı simgesi
            //   title: Text('Kredi Kartlarım'), // Kredi Kartlarım
            //   trailing: Icon(Icons.chevron_right), // Sağa ok simgesi
            // ),
            ListTile(
              leading: Icon(Icons.settings), // Ayarlar simgesi
              title: Text('Ayarlar'), // Ayarlar
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserSettingScreen()),
                );
              }, // Sağa ok simgesi
            ),
            ListTile(
              leading: Icon(Icons.logout), // Çıkış simgesi
              title: Text('Çıkış Yap'), // Çıkış Yap
              onTap: () {
                debugPrint('ben çıkmıyorum bu uygulama çok iyiymiş');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

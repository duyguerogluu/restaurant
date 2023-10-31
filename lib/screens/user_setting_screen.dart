import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSettingScreen extends ConsumerWidget {
  UserSettingScreen({Key? key}) : super(key: key);

  final notificationProvider = StateProvider<bool>((ref) => true);
  final darkThemeProvider = StateProvider<bool>((ref) => false);
  final languageProvider = StateProvider<String>((ref) => 'Türkçe');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationValue = ref.watch(notificationProvider);
    final darkThemeValue = ref.watch(darkThemeProvider);
    final selectedLanguage = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Profil Bilgileri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Bildirim Tercihleri'),
              trailing: Switch(
                value: notificationValue,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              title: Text('Dil Seçimi'),
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                onChanged: (String? newValue) {},
                items: <String>['Türkçe', 'English', 'Deutsch', 'Español']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title: Text('Uygulama Teması'),
              trailing: Switch(
                value: darkThemeValue,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              title: Text('Gizlilik ve Güvenlik'),
              onTap: () {
                // Navigate to privacy and security settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}

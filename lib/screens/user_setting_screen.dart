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

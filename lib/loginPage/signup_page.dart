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
import 'package:restaurant/riverpod/riverpod_management.dart';

class SignupPage extends ConsumerStatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  bool _ishidden = true;
  bool isProcessing = false;
  bool _pageLogin = true;

  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var model = ref.read(signup);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(143, 148, 251, .2),
                    blurRadius: 20.0,
                    offset: Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            controller: model.adi,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ad",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            controller: model.soyadi,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Soyad",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            controller: model.telefon,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Telefon Numarası",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            controller: model.email,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email Adres",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: model.sifre,
                              cursorColor: Colors.purpleAccent,
                              obscureText: _ishidden ? true : false,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 253, 210, 92)),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(_ishidden
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: _toggleVisibility,
                                ),
                                border: InputBorder.none,
                                hintText: "Şifre",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            )),
                        //ConfirmPassword(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: isProcessing
                    ? null
                    : () async {
                        setState(() {
                          isProcessing = true;
                        });
                        await model.fetchSignup(context);
                        setState(() {
                          isProcessing = false;
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pageLogin
                      ? const Color.fromARGB(255, 253, 210, 92)
                      : Colors.transparent,
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Kaydol',
                  style: TextStyle(
                    fontSize: 18,
                    color: _pageLogin
                        ? Colors.white
                        : Color.fromARGB(255, 217, 217, 217),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

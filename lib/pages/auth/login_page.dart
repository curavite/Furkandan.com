// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/pages/profil_page.dart';
import 'package:flutter_full_learn/pages/auth/register_page.dart';
import 'package:flutter_full_learn/service/aut_service.dart';
import 'package:path/path.dart';

import '../home_page.dart';

class login_page extends StatelessWidget {
  login_page({super.key});
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const profil_page(),
          ));
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.blueGrey.shade600,
          body: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.only(left: 400),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const profil_page(),
                        ));
                      },
                      icon: Icon(Icons.cancel)),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Giriş Yap',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "E-mail boş geçilemez";
                            } else {}
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                          decoration: InputDecoration(
                              hintText: "E-Posta Adresi",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.5),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "E-mail boş geçilemez";
                            } else {}
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                          decoration: InputDecoration(
                              hintText: "Şifre",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.5),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: signIn, child: Text('Giriş Yap')),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              '-----------------------------------        ',
                              style: TextStyle(color: Colors.white12),
                            ),
                            Text('VEYA'),
                            Text(
                              '         ------------------------------',
                              style: TextStyle(color: Colors.white12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ListTile(
                          title: Text(
                            'Google ile Devam Et',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue),
                          ),
                          tileColor: Colors.black54,
                          leading: Icon(
                            Icons.g_mobiledata_sharp,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Google kimliğinizle bir sonraki adıma geçmeniz halinde Bireysel Hesap Sözleşmesini ve Eklerini kabul etmiş sayılırsınız ',
                          style: TextStyle(color: Colors.white38),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Henüz hesabın yok mu?',
                          style: TextStyle(color: Colors.white38),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              _navigateToNextScreen(context);
                            },
                            child: const Text.rich(TextSpan(
                                text: 'Hesap Aç',
                                style: TextStyle(fontSize: 16))))
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
        Navigator.of(context as BuildContext).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => home_page()),
            (route) => false);
      } else {
        showDialog(
            context: context as BuildContext,
            builder: (context) {
              return AlertDialog(
                title: Text("Giriş yapılamadı"),
                content: Text(result!),
              );
            });
      }
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => register_page()));
  }
}

// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/pages/profil_page.dart';
import 'package:flutter_full_learn/pages/auth/login_page.dart';

class register_page extends StatelessWidget {
  register_page({super.key});
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
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
                        Text('Hesap Aç',
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
                              return "Şifre boş geçilemez";
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
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                var userResult = await firebaseAuth
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                formKey.currentState!.reset;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Kayıt başarılı,giriş sayfasına yönlendiriliyorsunuz"),
                                  ),
                                );
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => login_page(),
                                ));
                                print(userResult.user!.uid);
                              } else {}
                            },
                            child: Text('Kayıt Ol')),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}

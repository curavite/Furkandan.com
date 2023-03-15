// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/pages/auth/register_page.dart';
import 'package:flutter_full_learn/pages/home_page.dart';
import 'package:flutter_full_learn/pages/auth/login_page.dart';

class profil_page extends StatelessWidget {
  const profil_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const home_page(),
            )),
          },
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 170,
              width: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    'HESAP AÇ / GİRİŞ YAP',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  ListTile(
                    title: Text(
                      'Hesap Aç',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {
                      Navigator.pushNamed(context, "/register_page");
                    },
                  ),
                  Divider(color: Colors.black12),
                  ListTile(
                    title: Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => login_page(),
                      ));
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              height: 170,
              width: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    'İLAN YÖNETİMİ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  ListTile(
                    title: Text(
                      'Yayında Olanlar',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                  Divider(color: Colors.black12),
                  ListTile(
                    title: Text(
                      'Yayında Olmayanlar',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              height: 240,
              width: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    'MESAJLAR VE BİLGİLENDİRMELER',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  ListTile(
                    title: Text(
                      'İlan Mesajları',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                  Divider(color: Colors.black12),
                  ListTile(
                    title: Text(
                      'GeT Mesajları',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                  Divider(color: Colors.black12),
                  ListTile(
                    title: Text(
                      'Bilgilendirmeler',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              height: 170,
              width: 500,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    'FAVORİLER',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  ListTile(
                    title: Text(
                      'Favori İlanlar',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                  Divider(color: Colors.black12),
                  ListTile(
                    title: Text(
                      'Favori Satıcılar',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

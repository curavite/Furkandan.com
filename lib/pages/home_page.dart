// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/pages/advertise_page.dart';
import 'package:flutter_full_learn/pages/message_box_page.dart';
import 'package:flutter_full_learn/pages/profil_page.dart';
import 'package:flutter_full_learn/widgets/custom_text_button.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityStatus = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _streamSubscription;
  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('furkandan.com', style: TextStyle(color: Colors.yellow)),
          actions: const [Icon(Icons.message)],

          //actions: [Icon(Icons.profile)],
        ),
        drawer: NavigationDrawer(
          children: [buildMenuItems(context), buildHeader(context)],
        ));
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Wrap(
        runSpacing: 16,
        children: [
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text('Anasayfa'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const home_page(),
                ));
                wifiCheck(context);
              }),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: Text('Profilim'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const profil_page(),
              ));
              wifiCheck(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: Text('İlan Ver'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const advertise_page(),
              ));
              wifiCheck(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: Text('Mesaj Kutum'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const message_box_page(),
              ));
              wifiCheck(context);
            },
          ),
          const Divider(color: Colors.black54),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 16)),
              Icon(Icons.account_circle_outlined),
              SizedBox(
                width: 30,
              ),
              Column(
                children: const [
                  Text(
                    'EMLAK                                ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Konut,İş Yeri,Arsa,Konut Projeleri',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 16)),
              Icon(Icons.account_circle_outlined),
              SizedBox(
                width: 30,
              ),
              Column(
                children: const [
                  Text(
                    'VASITA                                           ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Otomobil,Arazi,SUV & Pickup,Motosiklet',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 16)),
              Icon(Icons.account_circle_outlined),
              SizedBox(
                width: 30,
              ),
              Column(
                children: const [
                  Text(
                    'YEDEK PARÇA,AKSESUAR                     ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Otomotiv Ekipmanları,Motosiklet Ekipmanları ',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 16)),
              Icon(Icons.account_circle_outlined),
              SizedBox(
                width: 30,
              ),
              Column(
                children: const [
                  Text(
                    'İkinci El ve Sıfır Alışveris                  ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Bilgisayar,Cep Telefonu,Fotoğraf Makinesi',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          )
        ],
      );

  void wifiCheck(BuildContext context) {
    if (_connectivityStatus == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("İnternet Hatası!!!"),
            content: Text("Lütfen internet bağlantınızı kontrol ediniz."),
          );
        },
      );
    }
  }

  Future<void> _initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.message);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectivityStatus = result;
      print(result.name.toString());
    });
  }
}

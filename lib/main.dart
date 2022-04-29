import 'dart:ui';

import 'package:call/Screens/ComposeNumber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Providers/Infos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();

  // print(user!.uid);

  runApp(MultiProvider(
    providers: [
      ListenableProvider<Infos>(
        create: (_) => Infos(),
      ),
    ],
    child: MaterialApp(
        theme: ThemeData(fontFamily: 'myfont', primaryColor: Color(0xff08DF78) ),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: ComposeNumber()
        //  user == null ? UserType() : accueil() // signin()
        ),
  ));
}

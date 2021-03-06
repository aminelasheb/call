import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:call/Screens/ComposeNumber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Providers/Infos.dart';
import 'Screens/ContactUI.dart';

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
        theme: ThemeData(fontFamily: 'myfont', primaryColor: Color(0xff08DF78)),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: AnimatedSplashScreen(
            splashIconSize: 120,
            duration: 2000,
            splash: const Image(
              image: AssetImage("assets/logo.png"),
            ),
            nextScreen: ComposeNumber())
        //  user == null ? UserType() : accueil() // signin()
        ),
  ));
}

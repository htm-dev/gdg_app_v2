import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_app/config/config_page.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);

  GdgCasablanca.prefs = await SharedPreferences.getInstance();
  runApp(ConfigPage());
}




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_app/agenda/agenda_page.dart';
import 'package:gdg_app/config/index.dart';
import 'package:gdg_app/home/home_page.dart';
import 'package:gdg_app/make_story/image_capture.dart';
import 'package:gdg_app/map/map_page.dart';
import 'package:gdg_app/speakers/speakers_page.dart';
import 'package:gdg_app/stories/stories_app.dart';
import 'package:gdg_app/team/team_page.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;
  @override
  void initState(){
    super.initState();
    setupApp();
   
  }
  setupApp(){
    configBloc = ConfigBloc();
    configBloc.darkModeOn = GdgCasablanca.prefs.getBool(GdgCasablanca.darkPref) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context)=>configBloc,
      child: BlocBuilder<ConfigBloc,ConfigState>(
          builder: (context,state){
            return MaterialApp(
                title: 'GDG Casablanca',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                //* Custom Google Font
                fontFamily: GdgCasablanca.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                disabledColor: Colors.grey,
                cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                canvasColor:
                configBloc.darkModeOn ? Colors.black : Colors.grey[50],
                brightness:
                configBloc.darkModeOn ? Brightness.dark : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                colorScheme: configBloc.darkModeOn
                    ? ColorScheme.dark()
                    : ColorScheme.light()),
            appBarTheme: AppBarTheme(
            elevation: 0.0,
            ),
            ),
              home: HomePage(),
              routes: {
                  HomePage.routeName:(context)=>HomePage(),
                  AgendaPage.routeName:(context) =>AgendaPage(),
                  SpeakersPage.routeName:(context) =>SpeakersPage(),
                  TeamPage.routeName:(context) =>TeamPage(),
                  MapPage.routeName:(context) =>MapPage(),
                  StoriesPage.routeName:(context)=>StoriesPage(),
                  ImageCapture.routeName:(context) => ImageCapture(),
              },
            );
          },
      ),
    );
  }
}

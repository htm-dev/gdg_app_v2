import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_app/config/config_bloc.dart';
import 'package:gdg_app/config/config_event.dart';
import 'package:gdg_app/make_story/image_capture.dart';
import 'package:gdg_app/stories/stories_app.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';
import 'package:share/share.dart';

class DevScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget bottomNavBar;
  final Widget tabBar;
  final  currentIndex = 0;
  final _selectedIndex = 0;
  final  _counter = 0;
  const DevScaffold(
      {Key key , @required this.body,@required this.title,this.bottomNavBar, this.tabBar}
      ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      color: ConfigBloc().darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: title != null ?
            Text(title) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  GdgCasablanca.logo,
                  fit: BoxFit.contain,
                  height: 32,
                ),
              ],
            ),
            centerTitle: true,
            bottom: tabBar != null ? tabBar: null,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  ConfigBloc().darkModeOn
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                ),
                onPressed: (){
                  ConfigBloc()
                      .dispatch(DarkModeEvent(!ConfigBloc().darkModeOn));
                },
              ),
              IconButton(
                //TODO : Change the sharing message
                onPressed: ()=>Share.share(
                    "Donwload the new ....."
                ),
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
              )
            ],
          ),
          bottomNavigationBar: bottomNavBar,
          body: body,
          floatingActionButton: SpeedDial
            (
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: Icon(FontAwesomeIcons.circle),
                  label: "Stories",
                  onTap: ()=> Navigator.pushNamed(context, StoriesPage.routeName)
              ),
              SpeedDialChild(
                  child: Icon(Icons.camera),
                  label: "Make Story",
                  onTap: ()=>Navigator.pushNamed(context, ImageCapture.routeName)
              )
            ],
          ),
          /* bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => () {
              /*_selectedIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);*/
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Users'),
                  activeColor: Colors.purpleAccent
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Messages'),
                  activeColor: Colors.pink
              ),

            ],
          ),*/
        ),
      ),
    );
  }
}

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_app/agenda/agenda_page.dart';
import 'package:gdg_app/config/config_bloc.dart';
import 'package:gdg_app/map/map_page.dart';
import 'package:gdg_app/speakers/speakers_page.dart';
import 'package:gdg_app/stories/stories_app.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';
import 'package:gdg_app/universal/image_card.dart';
import 'package:gdg_app/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeFront extends StatelessWidget {

  List<Widget> EventsText(context) =>[
    Text(
      GdgCasablanca.welcomeText,
      style: Theme.of(context).textTheme.headline,
      textAlign: TextAlign.center,
    ),
    SizedBox(
      height: 10,
    ),
    Text(
      GdgCasablanca.descText,
      style: Theme.of(context).textTheme.caption,
      textAlign: TextAlign.center,
    )
  ];
  Widget newActions(context) => Wrap(
    alignment: WrapAlignment.center,
    spacing: 20.0,
    runSpacing: 20.0,
    children: <Widget>[
     ActionCard(
       icon: Icons.schedule,
       color: Colors.amber,
       title: "Agenda",
       onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
     ),
      ActionCard(
        icon: Icons.person,
        color: Colors.green,
        title: "Speakers",
        onPressed: () => Navigator.pushNamed(context, SpeakersPage.routeName),
      ),
      ActionCard(
        icon: FontAwesomeIcons.meetup,
        color: Colors.red,
        title: "Meetup",
        onPressed: () async{
          const url = GdgCasablanca.meet_up_url;
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }
        },
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text(
               //TODO : styling this text
               "Upcoming",
               style: TextStyle(color: Colors.grey),
             )
            ],
          ),
          ImageCard(
            img : ConfigBloc().darkModeOn
                ? GdgCasablanca.banner_dark
                : GdgCasablanca.banner_light,
          ),
          SizedBox(
            height: 20,
          ),
          ... EventsText(context),
          SizedBox(
            height: 50,
          ),
        newActions(context),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon : Icon(
                  FontAwesomeIcons.calendar,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Add2Calendar.addEvent2Cal(GdgCasablanca.event);
                },
              ),
              Text(GdgCasablanca.event_date,
                  style: TextStyle(color: Colors.grey),),
              IconButton(
                icon: Icon(FontAwesomeIcons.mapMarkerAlt),
              onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
              color: Colors.grey,),
              Text(GdgCasablanca.event_place,
                style: TextStyle(color: Colors.grey),),
            ],
          )
        ],
      ),),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width*0.2,
        decoration: BoxDecoration(
            color: ConfigBloc().darkModeOn
                ? Tools.hexToColor("#1f2124")
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: ConfigBloc().darkModeOn
                ?null : [
              BoxShadow(color: Colors.grey[200],
                blurRadius:10,
                spreadRadius: 5,)
            ]
        ),
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,
            color: color,),
            SizedBox(
              height: 10,
            ),
            Text(title,
              style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 12,
              ),)
          ],
        ),
      ),
    );
  }
}

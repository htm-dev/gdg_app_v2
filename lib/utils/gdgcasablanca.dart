import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GdgCasablanca{
  static const String app_name="GDG Casblanca";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1 ;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryColor = Colors.black;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = true;
  static const String event_date = "SAT,DEC 28, 10:00AM";
  static const String event_place = "EMSI Les oranges";
  static const String meet_up_url ="https://www.meetup.com/GDGCasablanca/events/past/";

  //Images

  static const String logo ="assets/images/gdglogo.png";
  static const String banner_light ="assets/images/banner_light.png";
  static const String banner_dark ="assets/images/banner_dark.png";

  //Text
  static const String welcomeText = "Welcome to GDG DevFest";
  static const String descText =
  '''It’s the best time of the year - DevFest season! It’s time of DevFest Casablanca, one of the biggest tech events in Morocco, so we are honored to announce the 3rd edition of DevFest Casablanca.''';

  static const String loading_text = "Loading...";
  static const String try_again_text = "Try Again";
  static const String some_error_text = "Some error";
  static const String signInText = "Sign In";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "Sign Out";
  static const String wrongText = "Something went wrong";
  static const String confirmText = "Confirm";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";

  //Event Calender
  static Event event =  Event
    (
    title: 'DEVFEST Casablanca',
    description: descText,
    location: event_place,
    startDate: DateTime.parse("2019-12-28 10:00:00"),
    endDate: DateTime.parse("2019-12-28 19:00:00Z"),
  );
  // Preferences
  static SharedPreferences prefs;
  static const String darkPref = "darkPref";

}
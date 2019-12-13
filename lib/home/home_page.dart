import 'package:flutter/material.dart';
import 'package:gdg_app/home/home_bloc.dart';
import 'package:gdg_app/home/home_screen.dart';
import 'package:gdg_app/universal/dev_scaffold.dart';

class HomePage extends StatelessWidget {
  static const String routeName="/home";
  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return DevScaffold(
      body: HomeScreen(homeBloc: _homeBloc,),
    );
  }
}

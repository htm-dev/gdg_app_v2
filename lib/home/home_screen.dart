import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_app/home/home_widgets/home_front.dart';
import 'index.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
}) : _homeBloc = homeBloc,
      super(key : key);

  final HomeBloc _homeBloc;
  @override
  HomeScreenState createState(){
    return HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen>{
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  void initState(){
    super.initState();
    this._homeBloc.dispatch(LoadHomeEvent());
  }

  void dispose(){
    super.dispose();
  }

  Widget build(BuildContext context){
    return BlocBuilder<HomeBloc,HomeState>(
      bloc: widget._homeBloc,
      builder: (context,currentState){
        if(currentState is UnHomeState){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return HomeFront();
      },
    );
  }
}
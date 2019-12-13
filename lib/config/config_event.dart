

import 'package:equatable/equatable.dart';
import 'package:gdg_app/utils/gdgcasablanca.dart';
import 'index.dart';
import 'package:meta/meta.dart';
@immutable
abstract class ConfigEvent extends Equatable{
  ConfigEvent([List props = const <dynamic>[]]) : super(props);
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}
class DarkModeEvent extends ConfigEvent{

  final bool darkOn;

  DarkModeEvent(this.darkOn);
  String toString()=>'DarkModeEvent';
  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async{
    try{
      bloc.darkModeOn = darkOn;
      GdgCasablanca.prefs.setBool(GdgCasablanca.darkPref, darkOn);
      return InconfigState();
    }catch(_ , stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }

}
class LoadConfigEvent extends ConfigEvent{

  String toString()=>'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds:  2));
      return InconfigState();
    }catch(_ , stackTrace){
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'index.dart';
class ConfigBloc extends Bloc<ConfigEvent , ConfigState>{
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();
  factory ConfigBloc(){
    return _configBlocSingleton;
  }
  ConfigBloc._internal();

  bool darkModeOn = false;
  @override
  // TODO: implement initialState
  ConfigState get initialState =>UnconfigState();

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    try{
        yield UnconfigState();
        yield await event.applyAsync(currentState: currentState, bloc: this);

    }catch(_,stackTrace){
      print('$_ $stackTrace');
      yield currentState;
    }
    
  }

}
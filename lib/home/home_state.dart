import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class HomeState extends Equatable{
    HomeState([Iterable props]) : super(props);

    HomeState getStateCopy();
}

class UnHomeState extends HomeState{
  String toString() => 'UnHomeState';

  HomeState getStateCopy(){
    return UnHomeState();
}
}

class InHomeState extends HomeState{
  String toString() => 'InHomeState';

  HomeState getStateCopy(){
    return InHomeState();
  }
}

class ErrorHomeState extends HomeState{
 final String errorMessage;

 ErrorHomeState(this.errorMessage);
 String toString() => 'ErrorHomeState';
  HomeState getStateCopy(){
    return ErrorHomeState(this.errorMessage);
  }
}
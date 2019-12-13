import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class ConfigState extends Equatable{
  ConfigState([List props = const<dynamic>[]]) : super(props);

  ConfigState getStateCopy();
}

class UnconfigState extends ConfigState{
  String toString()=> 'UnConfigState';
  @override
  ConfigState getStateCopy() {
    return UnconfigState();
  }

}

class InconfigState extends ConfigState{
  String toString()=> 'InConfigState';
  @override
  ConfigState getStateCopy() {
    return InconfigState();
  }

}

class ErrorConfigState extends ConfigState{

  final String errorMessage;
  ErrorConfigState(this.errorMessage);
  String toString()=> 'ErrorConfigState';
  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }

}


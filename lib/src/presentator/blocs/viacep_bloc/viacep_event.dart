part of 'viacep_bloc.dart';

abstract class ViacepEvent extends Equatable {
  const ViacepEvent();

  @override
  List<Object> get props => [];
}

class LoadViaCepEvent extends ViacepEvent {
  final String searchCep;

  const LoadViaCepEvent({this.searchCep = ''});

  @override
  List<Object> get props => [searchCep];
}

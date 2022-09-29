// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'viacep_bloc.dart';

abstract class ViacepState extends Equatable {
  const ViacepState();

  @override
  List<Object> get props => [];
}

class ViacepLoadingState extends ViacepState {}

class ViacepLoadedState extends ViacepState {
  final Cep cep;

  const ViacepLoadedState({
    required this.cep,
  });
  @override
  List<Object> get props => [cep];
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cep.dart';
import '../../../external/service/cep_service_imp.dart';

part 'viacep_event.dart';
part 'viacep_state.dart';

class ViacepBloc extends Bloc<ViacepEvent, ViacepState> {
  final HttpCepServiceImp _cepServiceImp;
  StreamSubscription? _cepSubscription;

  ViacepBloc({required HttpCepServiceImp cepServiceImp})
      : _cepServiceImp = cepServiceImp,
        super(ViacepLoadingState()) {
    on<LoadViaCepEvent>(_onLoadCep);
  }

  void _onLoadCep(LoadViaCepEvent event, Emitter<ViacepState> emit) async {
    emit(ViacepLoadingState());
    print(event.searchCep);
    try {
      _cepSubscription?.cancel();
      var cep = await _cepServiceImp.getCep(event.searchCep);
      emit(ViacepLoadedState(cep: cep));
    } catch (e) {
      print("Erro");
    }
  }

  @override
  Future<void> close() {
    _cepSubscription?.cancel();
    return super.close();
  }
}

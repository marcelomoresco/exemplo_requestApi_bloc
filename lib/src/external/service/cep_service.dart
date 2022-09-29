import '../../domain/entities/cep.dart';

abstract class ICepService {
  Future<Cep> getCep(String query);
}

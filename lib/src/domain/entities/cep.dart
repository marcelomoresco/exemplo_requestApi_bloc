// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cep {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  Cep({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      cep: json['cep'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      ddd: json['lodddgradouro'],
    );
  }
}

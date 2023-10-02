import 'package:ford/models/result_endereco.dart';

class Loja {
  int id;
  String nome;
  ResultEndereco endereco;

  Loja({
    required this.id,
    required this.nome,
    required this.endereco,
  });

  factory Loja.fromMap(Map<String, dynamic> map) {
    return Loja(
      id: map["id"],
      nome: map["nome"],
      endereco: map["endereco"],
    );
  }
}

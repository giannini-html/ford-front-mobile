import 'package:ford/models/tipo_veiculo.dart';
import 'package:flutter/material.dart';

class Loja {
  int id;
  String nome;
  String estado;
  String cidade;
  String bairro;
  Color cor = Color.fromARGB(255, 81, 57, 216);
  IconData icone;

  Loja({
    required this.id,
    required this.nome,
    required this.cor,
    required this.estado,
    required this.cidade,
    required this.bairro,
    required this.icone,
  });
}

enum EstadoLoja { SP, RJ, RS }

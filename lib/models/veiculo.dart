import 'package:ford/models/tipo_veiculo.dart';

class Veiculo {
  String id;
  String descricao;
  TipoVeiculo tipoVeiculo;
  double valor;

  Veiculo({
    required this.id,
    required this.descricao,
    required this.tipoVeiculo,
    required this.valor,
  });
}

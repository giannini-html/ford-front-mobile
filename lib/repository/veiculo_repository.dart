import 'package:ford/models/tipo_veiculo.dart';

import '../models/veiculo.dart';

class VeiculosRepository {
  List<Veiculo> listarVeiculos() {
    return [
      Veiculo(
          id: '1',
          descricao: 'Bronco',
          tipoVeiculo: TipoVeiculo.Picape,
          valor: 150000.00),
      Veiculo(
          id: '2',
          descricao: 'Ranger',
          tipoVeiculo: TipoVeiculo.Picape,
          valor: 228000.00),
      Veiculo(
          id: '3',
          descricao: 'Sport',
          tipoVeiculo: TipoVeiculo.SUV,
          valor: 272000.00),
      Veiculo(
          id: '4',
          descricao: 'Territory',
          tipoVeiculo: TipoVeiculo.SUV,
          valor: 219390.00),
      Veiculo(
          id: '5',
          descricao: 'BronMustang Mach 1',
          tipoVeiculo: TipoVeiculo.Esportivo,
          valor: 576000.00),
    ];
  }
}

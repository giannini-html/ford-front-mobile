import 'package:ford/repository/veiculo_repository.dart';
import 'package:flutter/material.dart';

import '../components/veiculo_item.dart';
import '../models/tipo_veiculo.dart';
import '../models/veiculo.dart';

class VeiculosPage extends StatefulWidget {
  const VeiculosPage({super.key});

  @override
  State<VeiculosPage> createState() => _VeiculosPageState();
}

class _VeiculosPageState extends State<VeiculosPage> {
  final veiculosRepo = VeiculosRepository();
  late List<Veiculo> veiculos;

  @override
  void initState() {
    veiculos = veiculosRepo.listarVeiculos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Veículos'),
          actions: [
            // create a filter menu action
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text('Todas'),
                    onTap: () {
                      setState(() {
                        veiculos = veiculosRepo.listarVeiculos();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('SUVs'),
                    onTap: () {
                      setState(() {
                        veiculos = veiculosRepo
                            .listarVeiculos()
                            .where((veiculo) =>
                                veiculo.tipoVeiculo == TipoVeiculo.SUV)
                            .toList();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Esportivos'),
                    onTap: () {
                      setState(() {
                        veiculos = veiculosRepo
                            .listarVeiculos()
                            .where((veiculo) =>
                                veiculo.tipoVeiculo == TipoVeiculo.Esportivo)
                            .toList();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Hatchs'),
                    onTap: () {
                      setState(() {
                        veiculos = veiculosRepo
                            .listarVeiculos()
                            .where((veiculo) =>
                                veiculo.tipoVeiculo == TipoVeiculo.Hatch)
                            .toList();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Picapes'),
                    onTap: () {
                      setState(() {
                        veiculos = veiculosRepo
                            .listarVeiculos()
                            .where((veiculo) =>
                                veiculo.tipoVeiculo == TipoVeiculo.Picape)
                            .toList();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Sedans'),
                    onTap: () {
                      setState(() {
                        veiculos = veiculosRepo
                            .listarVeiculos()
                            .where((veiculo) =>
                                veiculo.tipoVeiculo == TipoVeiculo.Sedan)
                            .toList();
                      });
                    },
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: veiculos.length,
          itemBuilder: (context, index) {
            final veiculo = veiculos[index];
            return VeiculoItem(
              veiculo: veiculo,
              onTap: () {
                Navigator.pushNamed(context, '/veiculos-detalhes',
                    arguments: veiculo);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}

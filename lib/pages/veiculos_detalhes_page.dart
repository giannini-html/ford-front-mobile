import 'package:ford/models/veiculo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VeiculoDetalhesPage extends StatefulWidget {
  const VeiculoDetalhesPage({super.key});

  @override
  State<VeiculoDetalhesPage> createState() => _VeiculoDetalhesPageState();
}

class _VeiculoDetalhesPageState extends State<VeiculoDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    final veiculo = ModalRoute.of(context)!.settings.arguments as Veiculo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(veiculo.descricao),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Modelo'),
              subtitle: Text(veiculo.descricao),
            ),
            ListTile(
              title: const Text('Tipo'),
              subtitle: Text(veiculo.tipoVeiculo.toString().split('.').last),
            ),
            ListTile(
              title: const Text('Valor'),
              subtitle: Text(NumberFormat.simpleCurrency(locale: 'pt_BR')
                  .format(veiculo.valor)),
            ),
          ],
        ),
      ),
    );
  }
}

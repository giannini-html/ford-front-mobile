import 'package:ford/models/loja.dart';
import 'package:flutter/material.dart';

class LojaDetalhesPage extends StatefulWidget {
  const LojaDetalhesPage({super.key});

  @override
  State<LojaDetalhesPage> createState() => _LojaDetalhesPageState();
}

class _LojaDetalhesPageState extends State<LojaDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    final loja = ModalRoute.of(context)!.settings.arguments as Loja;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(loja.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Estado'),
              subtitle: Text(loja.estado),
            ),
            ListTile(
              title: const Text('Cidade'),
              subtitle: Text(loja.cidade),
            ),
            ListTile(
              title: const Text('Bairro'),
              subtitle: Text(loja.bairro),
            ),
          ],
        ),
      ),
    );
  }
}

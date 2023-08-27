import 'package:ford/models/loja.dart';
import 'package:ford/repository/loja_repository.dart';
import 'package:flutter/material.dart';

import '../components/loja_item.dart';

class LojasPage extends StatefulWidget {
  const LojasPage({super.key});

  @override
  State<LojasPage> createState() => _LojasPageState();
}

class _LojasPageState extends State<LojasPage> {
  final lojasRepo = LojaRepository();
  late List<Loja> lojas;

  @override
  void initState() {
    lojas = lojasRepo.listarLojas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lojas'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text('Todas'),
                    onTap: () {
                      setState(() {
                        lojas = lojasRepo.listarLojas();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('São Paulo'),
                    onTap: () {
                      setState(() {
                        lojas = lojasRepo
                            .listarLojas()
                            .where((loja) => loja.estado == 'SP')
                            .toList();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Rio de Janeiro'),
                    onTap: () {
                      setState(() {
                        lojas = lojasRepo
                            .listarLojas()
                            .where((loja) => loja.estado == 'RJ')
                            .toList();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Rio Grande do Sul'),
                    onTap: () {
                      setState(() {
                        lojas = lojasRepo
                            .listarLojas()
                            .where((loja) => loja.estado == 'RS')
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
          itemCount: lojas.length,
          itemBuilder: (context, index) {
            final loja = lojas[index];
            return LojaItem(
              loja: loja,
              onTap: () {
                Navigator.pushNamed(context, '/lojas-detalhes',
                    arguments: loja);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}

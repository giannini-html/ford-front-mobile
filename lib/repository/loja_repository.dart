import 'package:flutter/material.dart';
import 'package:ford/models/loja.dart';

class LojaRepository {
  List<Loja> listarLojas() {
    return [
      Loja(
          id: 1,
          nome: 'Sonnervig',
          cor: Colors.blue,
          estado: 'SP',
          cidade: 'São Paulo',
          bairro: 'Cambuci',
          icone: Icons.museum),
      Loja(
          id: 2,
          nome: 'Sonnervig',
          cor: Colors.blue,
          estado: 'SP',
          cidade: 'São Paulo',
          bairro: 'Vila Guilherme',
          icone: Icons.museum),
      Loja(
          id: 3,
          nome: 'Ford Studio',
          cor: Colors.blue,
          estado: 'SP',
          cidade: 'São Paulo',
          bairro: 'Perdizes',
          icone: Icons.museum),
      Loja(
          id: 4,
          nome: 'Ford Caer Oceânica',
          cor: Colors.blue,
          estado: 'RJ',
          cidade: 'Niterói',
          bairro: 'Itaipu',
          icone: Icons.museum),
      Loja(
          id: 5,
          nome: 'Ford Megafor',
          cor: Colors.blue,
          estado: 'RJ',
          cidade: 'Rio de Janeiro',
          bairro: 'Barra da Tijuca',
          icone: Icons.museum),
      Loja(
          id: 6,
          nome: 'SuperAuto Ford',
          cor: Colors.blue,
          estado: 'RS',
          cidade: 'Porto Alegre',
          bairro: 'Petrópolis',
          icone: Icons.museum),
      Loja(
          id: 6,
          nome: 'SuperAuto Ford',
          cor: Colors.blue,
          estado: 'RS',
          cidade: 'Porto Alegre',
          bairro: 'Partenon',
          icone: Icons.museum),
      Loja(
          id: 6,
          nome: 'SuperAuto Ford',
          cor: Colors.blue,
          estado: 'RS',
          cidade: 'Porto Alegre',
          bairro: 'Floresta',
          icone: Icons.museum),
    ];
  }
}

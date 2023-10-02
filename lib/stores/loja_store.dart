import 'package:flutter/material.dart';
import 'package:ford/models/loja.dart';
import 'package:ford/repository/loja_repository.dart';

class LojaStore {
  final ILojaRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<Loja>> state = ValueNotifier<List<Loja>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  LojaStore({required this.repository});

  Future getLojas() async {
    isLoading.value = true;
    try {
      final result = await repository.getLojas();
      state.value = result;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}

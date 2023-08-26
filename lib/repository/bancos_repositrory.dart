import '../models/conta.dart';

class BancosRepository {
  List<Conta> listarContas() {
    return [
      Conta(
        id: '1',
        bancoId: 'bb',
        descricao: '6,39% de Juros',
        tipoConta: TipoConta.contaCorrente,
      ),
      Conta(
        id: '2',
        bancoId: 'nubank',
        descricao: '5,00% de Juros',
        tipoConta: TipoConta.contaCorrente,
      ),
      Conta(
        id: '1',
        bancoId: 'caixa',
        descricao: '4,96% de Juros',
        tipoConta: TipoConta.contaPoupanca,
      ),
      Conta(
        id: '1',
        bancoId: 'c6bank',
        descricao: '4,65% de Juros',
        tipoConta: TipoConta.contaInvestimento,
      )
    ];
  }
}

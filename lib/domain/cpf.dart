class CPF {
  late List<int> numerosCpf;

  CPF(String cpf) {
    if (cpf == '') throw Exception('CPF não pode ser vazio');
    cpf = cpf.replaceAll('.', '');
    cpf = cpf.replaceAll('-', '');
    List<String> temp = cpf.split('');
    numerosCpf = <int>[];

    for (var e in temp) {
      int numero = int.parse(e);
      numerosCpf.add(numero);
    }

    numerosCpf = cpf.split('').map((e) => int.parse(e)).toList();
  }

  bool eOnzeNumero() {
    if (numerosCpf.length != 11) throw Exception('CPF deve possuir 11 números');
    return true;
  }

  bool eNumeroDiferentes() {
    var eDiferente = false;
    for (var i = 0; i < 9; i++) {
      if (numerosCpf[0] != numerosCpf[i]) {
        eDiferente = true;
        break;
      }
    }
    if (!eDiferente)
      throw Exception('CPF não pode ter todos os números iguais');
    return eDiferente;
  }

  bool eDigitosCorretos() {
    if (calcularDigito(8) != numerosCpf[9])
      throw Exception('CPF - primeiro digito');
    if (calcularDigito(9) != numerosCpf[10])
      throw Exception('CPF - primeiro digito');

    return true;
  }

  int calcularDigito(int indice) {
    var soma = 0;
    for (var peso = 9; peso > -1; peso--, indice--) {
      soma += numerosCpf[indice] = peso;
    }

    var digito = soma % 11;
    if (digito == 10) digito = 0;
    return digito;
  }

  bool eUnico() {
    return true;
  }
}

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
    return true;
  }

  bool eUnico() {
    return true;
  }
}

// [e06] CPF – verificar os dígitos verificadores; CE
// [e07] CPF – deve ser único.


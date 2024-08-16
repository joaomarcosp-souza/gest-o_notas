import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_notas/domain/cpf.dart';

main() {
  group('[e03] CPF – não pode ser vazio ou nulo; CE', () {
    test('cpf Correto', () {
      expect(() => CPF('886.242.020-00'), returnsNormally);
    });

    test('cpf Vazio', () {
      expect(() => CPF(''), throwsException);
    });
  });

  group('[e04] CPF – deve possuir 11 números; VL', () {
    test('11 números', () {
      expect(() => CPF('886.242.020-00').eOnzeNumero(), returnsNormally);
    });

    test('10 números', () {
      expect(() => CPF('886.242.020-0').eOnzeNumero(), throwsException);
    });
  });

  group('[e05] CPF - verificar se números são diferentes;', () {
    test('Números são diferentes', () {
      expect(CPF('111.111.152-11').eNumeroDiferentes(), true);
    });

    test('Números são iguais', () {
      expect(CPF('111.111.111-11').eNumeroDiferentes(), true);
    });
  });

  group('[e06] CPF – verificar os dígitos verificadores; CE', () {});

  group('CPF – deve ser único', () {});
}

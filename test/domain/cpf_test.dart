import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_aulas/domain/cpf.dart';

main() {
  group('CPF', () {
    group('[e03]  CPF - não pode ser vazio; ', () {
      CPF cpf = CPF('858.827.500-75');
      test('teste cpf não vazio', () {});
      test('[e04] CPF - deve possuir 11 números', () {});
    });

    group('[e04]  CPF - deve possuir 11 números', () {
      test('teste com 11 números', () {
        expect(CPF('858.827.500-75').eOnzeNumero(), true);
      });
      test('teste com 10 números', () {
        expect(() => CPF('858.827.500-7').eOnzeNumero(), throwsException);
      });
      test('teste com 13 números', () {
        expect(() => CPF('858.827.500-714').eOnzeNumero(), throwsException);
      });
    });

    group('[e05]  CPF - verificar se números são diferentes', () {
      test('teste com números diferentes', () {
        expect(CPF('858.827.500-75').eOnzeNumero(), true);
      });
      test('teste com 1 número diferente', () {
        expect(CPF('111.111.115-11').eNumeroDiferentes(), true);
      });
      test('teste com números iguais', () {
        expect(
            () => CPF('111.111.111-11').eNumeroDiferentes(), throwsException);
      });
    });
    group('[e06]  CPF – verificar os dígitos verificadores', () {
      test('teste com dígitos corretos', () {
        expect(CPF('858.827.500-75').eDigitosCorretos(), true);
      });
      test('teste com primeiro digito errado', () {
        expect(() => CPF('858.827.500-05').eDigitosCorretos(), throwsException);
      });
      test('teste com segundo dígito errado', () {
        expect(() => CPF('858.827.500-76').eDigitosCorretos(), throwsException);
      });
    });
  });
}

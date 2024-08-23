import 'package:gestao_aulas/Professor/dto_professor.dart';
import 'package:gestao_aulas/domain/cpf.dart';
import 'package:gestao_aulas/domain/interface/dao.professor.dart';

class Professor {
  late dynamic? id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String _status = 'A'; // _ Deixa o atributo privado
  //
  String get status => _status; //método de get
  set status(String status) {
    if (status != 'A' || status != 'i')
      throw Exception('Status deve ser "A" ou "I".');
    _status = status;
  }

  late IDAOProfessor dao;
  late DTOProfessor dto;

  Professor({required this.dao, required this.dto}) {
    id = dto.id;
    nome = dto.nome;
    descricao = dto.descricao;
    cpf = dto.cpf;
    _status = dto.status;

    CPF(cpf);
  }

  eNomeNaoVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio");
  }

  DTOProfessor salvar(DTOProfessor dto) {
    eNomeNaoVazio();
    return dao.salvar(dto);
  }
}

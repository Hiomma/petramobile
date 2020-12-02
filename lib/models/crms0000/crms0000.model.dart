import 'package:petramobile/models/crms0000/crms0001.model.dart';
import 'package:petramobile/models/crms0000/crms0002.model.dart';

class Crms0000 {
  int codigo;
  String pessoa;
  String emailsolicitante;
  String atendimento;
  String solicitacao;
  String posicao;
  String ocorrencia;
  String usuarioatual;
  String data;
  String contato;
  String usuario;
  String prioridade;
  String controle;
  String declaracaodetrabalho;
  String casePosicao;
  String nomeDoCliente;
  String nomeDaSolicitacao;
  String nomeDoAtendimento;
  String nomeDoContato;
  String nomeDoUsuario;
  List<Crms0001> crms0001;
  List<Crms0002> crms0002;

  Crms0000(
      {this.codigo,
      this.pessoa,
      this.emailsolicitante,
      this.atendimento,
      this.solicitacao,
      this.posicao,
      this.ocorrencia,
      this.usuarioatual,
      this.data,
      this.contato,
      this.usuario,
      this.prioridade,
      this.controle,
      this.declaracaodetrabalho,
      this.casePosicao,
      this.nomeDoCliente,
      this.nomeDaSolicitacao,
      this.nomeDoAtendimento,
      this.nomeDoContato,
      this.nomeDoUsuario,
      this.crms0001,
      this.crms0002});

  factory Crms0000.fromJson(Map<String, dynamic> json) {
    return Crms0000(
      codigo: json['codigo'],
      pessoa: json['pessoa'],
      emailsolicitante: json['emailsolicitante'],
      atendimento: json['atendimento'],
      solicitacao: json['solicitacao'],
      posicao: json['posicao'],
      ocorrencia: json['ocorrencia'],
      usuarioatual: json['usuarioatual'],
      data: json['data'],
      contato: json['contato'],
      usuario: json['usuario'],
      prioridade: json['prioridade'],
      controle: json['controle'],
      declaracaodetrabalho: json['declaracaodetrabalho'],
      casePosicao: json['case_posicao'],
      nomeDoCliente: json['nome_do_cliente'],
      nomeDaSolicitacao: json['nome_da_solicitacao'],
      nomeDoAtendimento: json['nome_do_atendimento'],
      nomeDoContato: json['nome_do_contato'],
      nomeDoUsuario: json['nome_do_usuario'],
      crms0001: Crms0001.fromJson(json['crms0001']),
      crms0002: Crms0002.fromJson(json['crms0002']),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['pessoa'] = pessoa;
    data['emailsolicitante'] = emailsolicitante;
    data['atendimento'] = atendimento;
    data['solicitacao'] = solicitacao;
    data['posicao'] = posicao;
    data['ocorrencia'] = ocorrencia;
    data['usuarioatual'] = usuarioatual;
    data['data'] = data;
    data['contato'] = contato;
    data['usuario'] = usuario;
    data['prioridade'] = prioridade;
    data['controle'] = controle;
    data['declaracaodetrabalho'] = declaracaodetrabalho;
    data['case_posicao'] = casePosicao;
    data['nome_do_cliente'] = nomeDoCliente;
    data['nome_da_solicitacao'] = nomeDaSolicitacao;
    data['nome_do_atendimento'] = nomeDoAtendimento;
    data['nome_do_contato'] = nomeDoContato;
    data['nome_do_usuario'] = nomeDoUsuario;
    if (crms0001 != null) {
      data['crms0001'] = crms0001.map((v) => v.toJson()).toList();
    }
    if (crms0002 != null) {
      data['crms0002'] = crms0002.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

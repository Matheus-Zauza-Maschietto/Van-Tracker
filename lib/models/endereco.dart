import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';

class Endereco {
  Estado estado;
  Municipio municipio;
  String bairro;
  String rua;
  String numero;
  String complemento;

  Endereco(this.estado, this.municipio, this.bairro, this.rua, this.numero, this.complemento);
}
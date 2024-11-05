class Municipio {
  int id;
  String nome;

  Municipio(this.id, this.nome);
  
  factory Municipio.fromJson(Map<String, dynamic> json){
    return Municipio(json['id'], json['nome']);
  }
}
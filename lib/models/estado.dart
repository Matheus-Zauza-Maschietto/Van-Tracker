class Estado {
  int id;
  String nome;

  Estado(this.id, this.nome);

  factory Estado.fromJson(Map<String, dynamic> json)
  {
    return Estado(json['id'], json['nome']);
  }
}
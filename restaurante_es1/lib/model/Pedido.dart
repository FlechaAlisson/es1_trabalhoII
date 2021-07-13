import 'dart:convert';

class Pedido {
  int id;
  double valor;
  String nome;
  String photoPath;
  String descricao;
  int quantidade;

  Pedido({
    required this.id,
    required this.valor,
    required this.nome,
    required this.photoPath,
    required this.descricao,
    required this.quantidade,
  });

  Pedido copyWith({
    int? id,
    double? valor,
    String? nome,
    String? photoPath,
    String? descricao,
    int? quantidade,
  }) {
    return Pedido(
      id: id ?? this.id,
      valor: valor ?? this.valor,
      nome: nome ?? this.nome,
      photoPath: photoPath ?? this.photoPath,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valor': valor,
      'nome': nome,
      'photoPath': photoPath,
      'descricao': descricao,
      'quantidade': quantidade,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      valor: map['valor'],
      nome: map['nome'],
      photoPath: map['photoPath'],
      descricao: map['descricao'],
      quantidade: map['quantidade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) => Pedido.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pedido(id: $id, valor: $valor, nome: $nome, photoPath: $photoPath, descricao: $descricao, quantidade: $quantidade)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pedido &&
        other.id == id &&
        other.valor == valor &&
        other.nome == nome &&
        other.photoPath == photoPath &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        valor.hashCode ^
        nome.hashCode ^
        photoPath.hashCode ^
        descricao.hashCode ^
        quantidade.hashCode;
  }
}

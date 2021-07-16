import 'dart:convert';

class Prato {
  int id;
  String nome;
  String descricao_breve;
  String descricao_completa;
  String ingredientes;
  double valor;
  String photoPath;
  int favorito;
  Prato({
    required this.id,
    required this.nome,
    required this.descricao_breve,
    required this.descricao_completa,
    required this.ingredientes,
    required this.valor,
    required this.photoPath,
    required this.favorito,
  });

  Prato copyWith({
    int? id,
    String? nome,
    String? descricao_breve,
    String? descricao_completa,
    String? ingredientes,
    double? valor,
    String? photoPath,
    int? favorito,
  }) {
    return Prato(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao_breve: descricao_breve ?? this.descricao_breve,
      descricao_completa: descricao_completa ?? this.descricao_completa,
      ingredientes: ingredientes ?? this.ingredientes,
      valor: valor ?? this.valor,
      photoPath: photoPath ?? this.photoPath,
      favorito: favorito ?? this.favorito,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao_breve': descricao_breve,
      'descricao_completa': descricao_completa,
      'ingredientes': ingredientes,
      'valor': valor,
      'photoPath': photoPath,
      'favorito': favorito,
    };
  }

  factory Prato.fromMap(Map<String, dynamic> map) {
    return Prato(
      id: map['id'],
      nome: map['nome'],
      descricao_breve: map['descricao_breve'],
      descricao_completa: map['descricao_completa'],
      ingredientes: map['ingredientes'],
      valor: map['valor'],
      photoPath: "images/" + map['photoPath'],
      favorito: map['favorito'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Prato.fromJson(String source) => Prato.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Prato(id: $id, nome: $nome, descricao_breve: $descricao_breve, descricao_completa: $descricao_completa, ingredientes: $ingredientes, valor: $valor, photoPath: $photoPath, favorito: $favorito)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Prato &&
        other.id == id &&
        other.nome == nome &&
        other.descricao_breve == descricao_breve &&
        other.descricao_completa == descricao_completa &&
        other.ingredientes == ingredientes &&
        other.valor == valor &&
        other.photoPath == photoPath &&
        other.favorito == favorito;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        descricao_breve.hashCode ^
        descricao_completa.hashCode ^
        ingredientes.hashCode ^
        valor.hashCode ^
        photoPath.hashCode ^
        favorito.hashCode;
  }
}

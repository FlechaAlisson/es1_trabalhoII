import 'dart:convert';

class Prato {
  int id;
  double valor;
  String nome;
  String photoPath;
  String descricao;
  int isFavorito;
  Prato({
    required this.id,
    required this.valor,
    required this.nome,
    required this.photoPath,
    required this.descricao,
    required this.isFavorito,
  });

  Prato copyWith({
    int? id,
    double? valor,
    String? nome,
    String? photoPath,
    String? descricao,
    int? isFavorito,
  }) {
    return Prato(
      id: id ?? this.id,
      valor: valor ?? this.valor,
      nome: nome ?? this.nome,
      photoPath: photoPath ?? this.photoPath,
      descricao: descricao ?? this.descricao,
      isFavorito: isFavorito ?? this.isFavorito,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valor': valor,
      'nome': nome,
      'photoPath': photoPath,
      'descricao': descricao,
      'isFavorito': isFavorito,
    };
  }

  factory Prato.fromMap(Map<String, dynamic> map) {
    return Prato(
      id: map['id'],
      valor: map['valor'],
      nome: map['nome'],
      photoPath: map['photoPath'],
      descricao: map['descricao'],
      isFavorito: map['isFavorito'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Prato.fromJson(String source) => Prato.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Prato(id: $id, valor: $valor, nome: $nome, photoPath: $photoPath, descricao: $descricao, isFavorito: $isFavorito)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Prato &&
        other.id == id &&
        other.valor == valor &&
        other.nome == nome &&
        other.photoPath == photoPath &&
        other.descricao == descricao &&
        other.isFavorito == isFavorito;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        valor.hashCode ^
        nome.hashCode ^
        photoPath.hashCode ^
        descricao.hashCode ^
        isFavorito.hashCode;
  }
}

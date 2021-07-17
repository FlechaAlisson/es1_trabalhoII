import 'dart:convert';

class User {
  int id;
  String nome;
  String endereco;
  String email;
  String fone;
  User({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.email,
    required this.fone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'endereco': endereco,
      'email': email,
      'fone': fone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      email: map['email'],
      fone: map['fone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class User {
  final int id; // Cambia a int si deseas mantener el tipo original
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'], // Sin conversión
      firstName: json['nombre'],
      lastName: json['apellido'],
      email: json['correo'],
      avatar: json['imagen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': firstName,
      'apellido': lastName,
      'correo': email,
      'imagen': avatar,
    };
  }
}

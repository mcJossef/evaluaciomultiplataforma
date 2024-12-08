import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<List<User>> fetchUsers() async {
  final url = Uri.parse('https://crud-express-sinbd.onrender.com/api/personas');
  final response = await http.get(url);

  print('Response body: ${response.body}'); // Debug the API response

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    print('Parsed data: $data'); // Debug the parsed data
    return data.map((userJson) => User.fromJson(userJson)).toList();
  } else {
    throw Exception('Error al obtener usuarios');
  }
}



Future<void> createUser(String firstName, String lastName, String email) async {
  final url = Uri.parse('https://crud-express-sinbd.onrender.com/');
  final body = json.encode({
    'nombre': firstName,
    'apellido': lastName,
    'correo': email,
  });

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 201) {
    print('Usuario creado exitosamente');
  } else {
    throw Exception('Error al crear usuario');
  }
}



Future<void> createUserWithImage(String firstName, String lastName, String email, File image) async {
  final url = Uri.parse('https://crud-express-sinbd.onrender.com/users');
  final request = http.MultipartRequest('POST', url);

  request.fields['first_name'] = firstName;
  request.fields['last_name'] = lastName;
  request.fields['email'] = email;

  // Cargar la imagen
  final imageFile = await http.MultipartFile.fromPath('avatar', image.path);
  request.files.add(imageFile);

  final response = await request.send();

  if (response.statusCode == 201) {
    print('Usuario creado exitosamente');
  } else {
    throw Exception('Error al crear usuario con imagen');
  }
}



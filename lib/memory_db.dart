import 'package:untitled/models/user.dart';

class Memorydb {
  static List<User?> UsersList = [User(email: "teste", nome: "teste", senha: "teste")];
  static User? CurrentUser;
}
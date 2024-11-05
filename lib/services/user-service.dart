import 'package:untitled/memory_db.dart';
import 'package:untitled/models/user.dart';

class UserService {
  (String errorMessage, bool isLogged, User? user) Login(String email, String senha) {
    User? user = Memorydb.UsersList.firstWhere(
            (user) => user?.email == email && user?.senha == senha,
        orElse: () => null
    );

    if(user == null)
      return ('Email ou senha inválidos', false, null);
    else
      return ('', true, user);

  }

  String Cadastrar(String email, String nome, String senha) {
    User newUser = User(email: email, senha: senha, nome: nome);

    if (email.isNotEmpty && senha.isNotEmpty && nome.isNotEmpty) {
      Memorydb.UsersList.add(User(email: email, senha: senha, nome: nome));
      return '';
    }
    else{
      return 'Por favor, preencha todos os campos';
    }
  }
}
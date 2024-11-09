import 'package:untitled/memory_db.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/repositories/user_repository.dart';

class UserService {
  UserRepository userRepository;
  UserService(this.userRepository);

  Future<(String errorMessage, bool isLogged, User? user)> Login(String email, String senha)  async {
    var usersJsonList = await userRepository.BuscarUsers();
     List<User> usersList = usersJsonList.map((p) => User.fromJson(p)).toList();
    User? user = usersList.cast<User?>().firstWhere(
          (user) => user?.email == email && user?.senha == senha,
      orElse: () => null,
    );

    if(user == null)
      return ('Email ou senha inválidos', false, null);
    else
      return ('', true, user);

  }

  Future<String> Cadastrar(String email, String nome, String senha) async {
    User newUser = User(email: email, senha: senha, nome: nome);

    if (email.isNotEmpty && senha.isNotEmpty && nome.isNotEmpty) {
      User usuario = User(email: email, senha: senha, nome: nome);
      await userRepository.CriarUser(usuario.toJson());
      return '';
    }
    else{
      return 'Por favor, preencha todos os campos';
    }
  }
}
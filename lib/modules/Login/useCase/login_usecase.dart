
import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_credentials.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_login_response.dart';
import 'package:examen_2do_parcial/modules/Login/domain/repository/login_repository.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

class LoginUseCase implements UseCase<UserCredentials, UserLoginResponse> {
  @override
  Future<UserLoginResponse> execute(UserCredentials params) async {
    final UserCredentials credentials = UserCredentials(user: params.user,password: params.password);
    final LocalStorage storage = LocalStorage('local_CarritoTiendita');


    if (!validationUser(params)) {
      throw Exception("Error de credenciales");
    }

    final UserLoginResponse response = await LoginRepository().execute(credentials);

    if (response != null) {
      storage.setItem("token", response.accesToken);
    }
    
    return response;
  }


  bool validationUser(UserCredentials params)
  {
    if(params.user.isEmpty && params.password.isEmpty) {
      return false;
    }
    if (params.user.length < 4 || params.password.length < 4) {
      return false;
    }
    return true;
  }
}

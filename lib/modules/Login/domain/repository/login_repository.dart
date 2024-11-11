
import 'package:examen_2do_parcial/infrastructure/app/repository/repository.dart';
import 'package:examen_2do_parcial/infrastructure/connection/connection.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_credentials.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_login_response.dart';

class LoginRepository implements Repository<UserCredentials, UserLoginResponse> {
  @override
  Future<UserLoginResponse> execute(UserCredentials params) async {
    final data = {
      "username": params.user,
      "password": params.password,
    };

    String url = "https://dummyjson.com/auth/login";
    Connection connection = Connection();
    final response = await connection.post(url, data, headers: {
      'Content-Type': 'application/json',
    });
    print(response);

    return UserLoginResponse.fromJson(response);
  }
}

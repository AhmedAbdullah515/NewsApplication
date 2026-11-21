import 'package:dio/dio.dart';
import 'package:full_application/Models/authmodel.dart';

class Authservice {
  static Dio dio = Dio();
  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response respons = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return AuthModel.fromjson(respons.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (other) {
      throw Exception(other.toString());
    }
  }

  static Future<AuthModel> register({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Email": email,
          "Name": name,
          "Password": password,
          "Phone": phone,
        },
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (other) {
      throw Exception(other.toString());
    }
  }
}

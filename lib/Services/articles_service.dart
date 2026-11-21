import 'package:dio/dio.dart';
import 'package:full_application/Models/articlemodel.dart';

class ArticlesService {
  static Dio dio = Dio();
  static Future<Articles> fetchusers() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Articles.fromjson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (otherError) {
      throw Exception(otherError.toString());
    }
  }
}

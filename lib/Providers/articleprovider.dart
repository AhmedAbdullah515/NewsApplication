
import 'package:flutter/foundation.dart';
import 'package:full_application/Models/articlemodel.dart';
import 'package:full_application/Services/articles_service.dart';

class Articleprovider extends ChangeNotifier {
  Articles? datamodel;
  String? error;

  Future<void> getnews() async {
    try {
      error = null;

      datamodel = await ArticlesService.fetchusers();

      print("NEWS LOADED: ${datamodel!.articles.length}");

    } catch (e) {
      error = e.toString();
      print("PROVIDER ERROR: $e");
    }

    notifyListeners();
  }
}

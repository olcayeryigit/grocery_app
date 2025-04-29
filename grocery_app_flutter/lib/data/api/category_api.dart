import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    return http.get(Uri.parse("http://localhost:5000/categories"));
  }
}

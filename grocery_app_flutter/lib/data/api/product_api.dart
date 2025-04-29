import 'package:http/http.dart' as http;
//as:aliens

class ProductApi {
  /*In Dart, using a static structure within a class means accessing functions directly from the class itself instead of creating instances of the class. If you don't want to use the new keyword, you can use static methods instead. These methods can be called directly from the class without the need to create an instance of the class.*/

  /*Android emulator: Use 10.0.2.2 instead of localhost, because the emulator accesses your computer's localhost through this special IP.

iOS emulator: You can use localhost directly, as the iOS emulator has direct access to your computer’s network.

Real device: Use your computer’s local IP address (e.g., 192.168.1.x). The device and the computer must be on the same Wi-Fi network.

Flutter Web on Chrome (PC): localhost works perfectly because both the Flutter app and the backend are running on the same machine. */
  static Future getProducts() {
    return http.get(Uri.parse("http://localhost:5000/products"));
    /*Uri.parse(): Converts a URL in string format into a Uri object that can be accepted by the http.get() function. */
  }

  static Future getProductsByCategoryId(int categoryId) {
    return http.get(
      Uri.parse("http://localhost:5000/products?categoryId=$categoryId"),
    );
  }
}

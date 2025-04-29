class Category {
  /*
-Immutable Data: final ensures a variable can only be assigned once.

- Better Performance: Dart can optimize for unchanging data.

- Safer Code: Prevents accidental changes to variables.

- Null Safety: Ensures variables are always initialized.

*/

  /*Using final for data that needs to be updated or deleted is not suitable because final variables can only be assigned once and cannot be changed. For updateable or deletable data, it's better to use mutable fields instead of final to allow changes.

*/

  /*I used final so that the properties of the Category object (id, name, seoUrl) can only be assigned once during object creation and cannot be changed afterward.
 */
  final int id; //immutable
  final String name; //immutable
  final String seoUrl; //immutable

  // CONSTRUCTOR

  /*
  In Dart, final variables must be initialized with a value. They can only be assigned once and cannot be changed afterward. Therefore, final variables must be initialized either in the constructor or at the point of declaration. Otherwise, you'll get an error. */

  /*required ensures that constructor parameters cannot be null and must be initialized with a value. This guarantees that final variables are properly initialized and provides null safety. */

  Category({required this.id, required this.name, required this.seoUrl});

  // CONVERT FROM JSON TO CATEGORY OBJECT

  /*FROMJSON:
  Purpose: It is used to convert JSON formatted data into a Dart object.

Use Case: It is used to process the data after receiving JSON data from APIs.

Example: If you are fetching user data from a web service, you can convert the JSON formatted data into a Dart object using fromJson and then work with the data.
   */

  /*factory
A factory constructor in Dart is a special constructor used to create an instance of a class.

It's often used when creating objects from JSON data or when more logic is needed during object creation.

With factory, you can return an existing instance or apply custom logic before returning a new one. */

  /* Map<String, dynamic>
A Map in Dart represents a key-value pair collection.

String: The type of the keys (e.g., "id", "name").

dynamic: The type of the values — can be anything (int, String, bool, etc.).*/

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name'], seoUrl: json['seoURL']);
    /*The id of the Category comes from the id in the JSON, the name of the Category comes from the name in the JSON, and the seoUrl of the Category comes from the seoUrl in the JSON */
  }

  // CONVERT CATEGORY OBJECT TO JSON
  /*TOJSON:
Purpose: It is used to convert a Dart object into JSON format.

Use Case: It is used to convert data into JSON format before sending it to an API.

Example: If you need to send data received from a user to a database or another service, you would use the toJson function to convert the data into JSON format.
 */
  /*Map<String, dynamic>: A map (dictionary) where the keys are String and the values can be any type (int, String, etc.). This represents JSON data.

toJson() function: Converts a Category object into JSON format.

return {'id': id, 'name': name, 'seoUrl': seoUrl};: This returns a map containing the id, name, and seoUrl properties from the object.

*/
  /*This function allows the Category object to be converted into JSON, which is useful for sending data over a network or saving it in a database. */
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'seoUrl': seoUrl};
  }
}

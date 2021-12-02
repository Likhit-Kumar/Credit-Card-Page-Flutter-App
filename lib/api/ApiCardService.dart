import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCardService {
  Future<ApiResponse> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://flutter-assignment-api.herokuapp.com/v1/cards?name=Likhit%20Card'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return ApiResponse(token: data["token"], error: data["error"]);
  }
}

class ApiResponse {
  final String token;
  final String error;

  ApiResponse({this.token, this.error});
}

// class Album {
//   final String id;
//   final String email;
//   final String name;
//   final String role;

//   Album({
//     this.id,
//     this.email,
//     this.name,
//     this.role
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       email: json['email'],
//       name: json['name'],
//       role: json['role']
//     );
//   }
// }

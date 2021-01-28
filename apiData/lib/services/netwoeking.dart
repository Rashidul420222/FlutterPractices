import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/album.dart';

class NetworkHelper {
  Future<Album> fetchAlbum() async {
    final http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load Album');
    }
  }

  Future<Album> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
        'https://jsonplaceholder.typicode.com/albums/$id',
        headers: <String, String>{
          'content': 'application',
        });

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Delete album');
    }
  }
}

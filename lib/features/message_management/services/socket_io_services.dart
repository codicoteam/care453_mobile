import 'package:http/http.dart' as http;

class ChatService {
  static const String baseUrl = 'http://your-server-url';

  Future<List<Map<String, dynamic>>> fetchMessages(String groupId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/groups/$groupId/messages'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.body as List);
    } else {
      throw Exception('Failed to fetch messages');
    }
  }

  Future<List<Map<String, dynamic>>> fetchUsers(String groupId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/groups/$groupId/users'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.body as List);
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}

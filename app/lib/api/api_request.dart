import 'package:app/api/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  final dataProvider = StateProvider<String>((ref) => "No Data");
  final userDataProvider = StateProvider<String>((ref) => "No Data");
  Future<String> fetchApiRepo(String query, WidgetRef ref) async {
    final data = ref.read(dataProvider);
    final url = Uri.parse(
      "https://api.github.com/search/repositories?q=$query",
    );
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token ${Token().token}',
      },
    );
    if (response.statusCode == 200) {
      ref.read(dataProvider.notifier).state = response.body;
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
    return data;
  }

  Future<String> fetchApiUser(String query, WidgetRef ref) async {
    final udata = ref.read(userDataProvider);
    final url = Uri.parse(
      "https://api.github.com/repos/$query",
    );
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token ${Token().token}',
      },
    );
    if (response.statusCode == 200) {
      ref.read(userDataProvider.notifier).state = response.body;
      print(udata);
    } else {
      throw Exception('Failed to load data');
    }
    return udata;
  }
}

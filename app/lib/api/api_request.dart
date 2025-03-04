import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  final token = dotenv.get('GITHUB_TOKEN');
  //リポジトリ検索
  Future<String> fetchApiRepo(String query, WidgetRef ref) async {
    final url = Uri.parse(
      "https://api.github.com/search/repositories?q=$query",
    );
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $token',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed to load data";
    }
  }

  //リポジトリの詳細情報検索
  Future<String> fetchRepoDetailInfo(
      String ownerQuery, String repoQuery, WidgetRef ref) async {
    final url = Uri.parse(
      "https://api.github.com/repos/$ownerQuery/$repoQuery",
    );
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $token',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed to load data";
    }
  }
}

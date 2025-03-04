import 'dart:convert';

class ChangeData {
  Future<Map<String, Map<String, String>>> Repo(String data) async {
    try {
      Map<String, Map<String, String>> repoMap = {};
      final changeData = jsonDecode(data);
      for (var item in changeData['items']) {
        repoMap[item['name']] = {
          'repo_name': item['name'],
          'owner_icon': item['owner']['avatar_url'],
          'owner_name': item['owner']['login'],
        };
      }
      return repoMap;
    } catch (e) {
      print(e);
      print('Failed to change data');
      return {};
    }
  }

  Future<Map<String, dynamic>> DetailInfo(String data) async {
    try {
      final changeData = jsonDecode(data);
      return changeData;
    } catch (e) {
      print(e);
      print('Failed to change data');
      return {};
    }
  }
}

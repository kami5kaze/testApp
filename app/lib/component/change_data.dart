import 'dart:convert';

class ChangeData {
  Future<Map<String, Map<String, String>>> Repo(String data) async {
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
  }
}

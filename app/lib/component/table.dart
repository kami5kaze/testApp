import 'package:app/detailInfo.dart';
import 'package:flutter/material.dart';

repoTable(Map<String, Map<String, String>> repoData, BuildContext context) {
  return Table(
    border: TableBorder.all(),
    children: [
      TableRow(
        children: [
          Center(
            child: Text("Owner_icon", style: TextStyle()),
          ),
          Center(
            child: Text("Owner_name"),
          ),
          Center(
            child: Text("Repo_name"),
          ),
        ],
      ),
      for (var item in repoData.entries)
        TableRow(
          children: [
            Image.network(
              item.value['owner_icon']!,
              width: 50,
              height: 50,
            ),
            Center(
              child: Text(item.value['owner_name']!),
            ),
            Center(
              child: GestureDetector(
                child: Text(
                  item.value['repo_name']!,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailinfo(
                        repoQuery: item.value['repo_name']!,
                        ownerQuery: item.value['owner_name']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    ],
  );
}

detailInfoTable(Map<String, dynamic> redata) {
  final Set<String> keys = {
    'language',
    'stargazers_count',
    'watchers_count',
    'forks_count',
    'open_issues_count'
  };
  return Padding(
    padding: EdgeInsets.all(5),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Center(
              child: Text('Owner'),
            ),
            Center(
              child: Text(redata['owner']['login']),
            ),
          ],
        ),
        for (var key in keys)
          TableRow(
            children: [
              Center(
                child: Text(key),
              ),
              Center(
                child: Text(redata[key].toString() ?? '不明'),
              ),
            ],
          ),
      ],
    ),
  );
}

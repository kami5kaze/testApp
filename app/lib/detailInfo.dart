import 'dart:convert';

import 'package:app/api/api_request.dart';
import 'package:app/component/change_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/home.dart';

class Detailinfo extends ConsumerWidget {
  final String ownerQuery;
  final String repoQuery;
  final dataProvider = StateProvider<Map<String, dynamic>>((ref) => {});
  Detailinfo({required this.ownerQuery, required this.repoQuery});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final redata = ref.watch(dataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Info'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final data = await ApiRequest()
                      .fetchRepoDetailInfo(ownerQuery, repoQuery, ref);
                  final renewalData =
                      await ChangeData().DetailInfo(data as String);
                  ref.read(dataProvider.notifier).state = renewalData;
                },
                child: const Text('詳細情報を取得'),
              ),
              if (redata.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(redata['owner']['avatar_url']),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['name']),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['language'] ?? '不明'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['stargazers_count'].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['watchers_count'].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['forks_count'].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['open_issues_count'].toString()),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

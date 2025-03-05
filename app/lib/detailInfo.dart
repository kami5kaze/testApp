import 'package:app/api/api_request.dart';
import 'package:app/component/change_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/component/table.dart';

class Detailinfo extends ConsumerWidget {
  final String ownerQuery;
  final String repoQuery;
  final dataProvider = StateProvider<Map<String, dynamic>>((ref) => {});
  final isVisibilityProvider = StateProvider<bool>((ref) => true);
  Detailinfo({required this.ownerQuery, required this.repoQuery});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final redata = ref.watch(dataProvider);
    final isVisibility = ref.watch(isVisibilityProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Info'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isVisibility,
                child: ElevatedButton(
                  onPressed: () async {
                    final data = await ApiRequest()
                        .fetchRepoDetailInfo(ownerQuery, repoQuery, ref);
                    final renewalData =
                        await ChangeData().DetailInfo(data as String);
                    ref.read(dataProvider.notifier).state = renewalData;
                    ref.read(isVisibilityProvider.notifier).state = false;
                  },
                  child: const Text('詳細情報を取得'),
                ),
              ),
              if (redata.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(redata['owner']['avatar_url'],
                          width: 200, height: 200),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(redata['name']),
                    ),
                    detailInfoTable(redata),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

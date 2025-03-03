import 'package:app/api/api_request.dart';
import 'package:app/component/change_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerWidget {
  final visibilityProvider = StateProvider<bool>((ref) => false);
  final repositoriesProvider =
      StateProvider<Map<String, Map<String, String>>>((ref) => {});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController = TextEditingController();
    final visibility = ref.watch(visibilityProvider);
    final repoData = ref.watch(repositoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'キーワードを入力してください',
                  ),
                  controller: textEditingController,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () async {
                    if (textEditingController.text.isEmpty) {
                      return;
                    }
                    final data = await ApiRequest()
                        .fetchApiRepo(textEditingController.text, ref);
                    final repositories = await ChangeData().Repo(data);
                    ref.read(repositoriesProvider.notifier).state =
                        repositories;
                    ref.read(visibilityProvider.notifier).state = true;
                  },
                  child: const Text('検索'),
                ),
              ),
              Visibility(
                visible: visibility,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Table(
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
                                  child: Text(
                                    item.value['repo_name']!,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

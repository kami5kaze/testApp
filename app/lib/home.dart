import 'package:app/api/api_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerWidget {
  final textProvider = StateProvider<String>((ref) => "No Data");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController = TextEditingController();
    final text = ref.watch(textProvider);
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
              ElevatedButton(
                onPressed: () async {
                  final data = await ApiRequest().fetchApiRepo("MukiMuki", ref);
                  ref.read(textProvider.notifier).state = data;
                  print("Home: $text");
                  print("Home: $data");
                },
                child: const Text('Fetch Data'),
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}

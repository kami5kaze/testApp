import 'package:flutter/material.dart';

textField(TextEditingController textEditingController) {
  return TextField(
    decoration: InputDecoration(
      hintText: 'キーワードを入力してください',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0), // 角を丸くする
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0), // 通常時の枠
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0), // フォーカス時の枠
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    controller: textEditingController,
  );
}

# testApp
# 課題
# リンク
# 環境
- **VScode:1.96.0**
- **Flutter:3.24.4**
- **Dart:3.5.4**
# プラットフォーム
# 使用技術
## ブランチ運用ルール
### ブランチ構成
リポジトリのブランチは以下のように構成します：

- **`main`**:
  - 本番環境で稼働する安定版コードを管理するブランチ。
  - **直接コミットは禁止**。必ずプルリクエスト経由で変更を行います。

- **`develop`**:
  - 次回リリースに向けた開発中のコードを統合するブランチ。
  - 各機能ブランチ（`feature/*`）からの変更を統合します。

- **`feature/{機能名}`**:
  - 新機能や改修を開発するための一時的なブランチ。
  - 命名例: `feature/user-authentication`, `feature/add-api`

### マージポリシー
- `main` および `develop` ブランチへの直接コミットは禁止。
- **プルリクエスト（Pull Request）を必須**とし、最低1名のレビューアによる承認を得てからマージを行います。

---

## コミットルール

### コミットメッセージフォーマット

- **type**: 変更の種類
  - `feat`: 新機能の追加
  - `fix`: バグ修正
  - `docs`: ドキュメントの変更
  - `style`: フォーマットの変更（機能に影響しない）
  - `refactor`: リファクタリング

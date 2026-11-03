# journal — JSON + MVC つぶやき表示

Tesla Roadsterについての架空の12件のつぶやきを表示・検索するFlutter Webアプリです。
デザインは授業教材の演習4と同じです。

## GitHubに公開する（コードの編集不要）

1. GitHubで **Public** リポジトリ `jouranal` を作る（READMEを自動生成しない）。
2. このフォルダの **中身をすべて** GitHubにアップロードする。`.github/workflows/deploy.yml` も必ず含める。
   - Gitを使う場合: `git init && git add . && git commit -m "Add jouranal" && git branch -M main && git remote add origin https://github.com/あなたのユーザー名/jouranal.git && git push -u origin main`
   - GitHubのWeb画面からアップロードする場合は、**隠しフォルダ `.github` を含む**ファイルを漏れなく登録してください。フォルダ階層を保つ必要があります。
3. リポジトリの **Settings → Pages → Build and deployment → Source** で **GitHub Actions** を選択する。
4. **Actions** タブで `Deploy Flutter journal to GitHub Pages` が成功したら公開完了。

公開URL（このリポジトリの場合）:
- アプリ: `https://sosuke4646.github.io/jouranal/`
- HTTP JSON: `https://sosuke4646.github.io/jouranal/posts.json`

※ GitHub Pagesを有効化してもアプリが公開されない場合、Actions タブでワークフローのエラーを確認してください。
※ GitHubユーザー名の置き換えは **コードでは不要** です。`Uri.base.resolve('posts.json')` が実行中のWebページと同じ場所のJSONをHTTP取得します。

## ローカル実行（Flutterが必要）

```bash
flutter create --platforms web .
flutter pub get
flutter run -d chrome
```

## ファイルの役割

- `lib/main.dart`: 起動
- `lib/model.dart`: HTTPでJSON取得
- `lib/controller.dart`: 投稿保持・検索
- `lib/view.dart`: 画面表示（教材のまま）
- `assets/posts.json`: 課題指定のJSON
- `.github/workflows/deploy.yml`: GitHub Pages自動公開

投稿を変更するときは `assets/posts.json` を更新します。GitHub Actions が公開用の `posts.json` を自動生成します。

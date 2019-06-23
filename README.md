#Blog Portfolio

ブログ機能のポートフォリオサイトです。
ログインすることなく、ブログの一覧、詳細などを閲覧することが出来ます。
ブログの作成、編集、削除などの一部の機能は名前、メール、パスワードを登録することで使用出来ます。

URL
https://sakaki-blog-portfolio.herokuapp.com

テストユーザー

###実行環境
- Ruby version :ruby 2.6.2
- framework :Rails 5.2.3
- Database :PostgreSQL :11.3
- image file upload :S3
- Deployment :heroku
- Installing :webpacker, :react, :react-fontawesome, :react-color, :classnames

##機能一覧
- プロフィール / 作成・編集・削除
- ブログ / 作成・編集・削除
- ユーザー認証（devise）・メール認証（sendgrid）
- 管理機能 / 作成・編集・削除（active-admin）
- 画像のアップロード(carrierwave)
- カテゴリー / 作成・編集・削除
- コメント / 作成・削除
- いいね / 作成・削除
- ページネーション / プロフィール・ブログ・カテゴリー（kaminari)
- ランキング / 投稿数・いいね数
- カラーピッカー / フォント色の選択(react-color)
- 日本語化(i18n)

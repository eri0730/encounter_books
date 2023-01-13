# アプリケーション名
### Encounter Books
<br>

# アプリケーション概要
[![Image from Gyazo](https://i.gyazo.com/d84966c98f90112970cde6c61fc0d9eb.jpg)](https://gyazo.com/d84966c98f90112970cde6c61fc0d9eb)
新しい本に出会える、推し本の共有・記録ができるWebアプリケーション
<br>
<br>

# URL
http://18.180.143.138/
<br>
<br>

# テスト用アカウント
- Basic認証ID：eri
- Basic認証パスワード：38185
- メールアドレス：test@com
- パスワード：111111
<br>
<br>

# 利用方法
## 本に出会う
1. トップページのヘッダーからユーザー新規登録を行う
2. 一覧ページで、気になる本をお気に入り登録をすることができる
3. トップページ右下の読みたいボタンをクリックすると、お気に入り登録した本の一覧を見ることができる
4. 一覧ページから投稿をクリックすると、詳細ページに遷移する

## おすすめ本の投稿・記録
1. トップページ右下の投稿するボタンから、本の画像、タイトル、著者名、あらすじ、おすすめ文、タグを入力し投稿する
2. ヘッダーのユーザー名をクリックすると、自分が投稿した本の一覧を確認することができ、記録ができる
<br>
<br>

# アプリケーションを作成した背景
職場の本好きの同僚が、自分で本を選ぶと作家やジャンルが偏ってしまうと言っていたことがきっかけです。私自身にも同じ悩みがあり、この課題をアプリの機能や視覚的な工夫で解決したい！と思い、作成しました。
<br>
<br>

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1WXfXYkpeSkjUIkqUKWsTtWgf4gCRJXjZbfa6vgMoB1I/edit#gid=982722306
<br>
<br>

# 実装した機能についての画像やGIFおよびその説明
## トップページ(一覧ページ)
[![Image from Gyazo](https://i.gyazo.com/bff7de36547590760568223823a46724.gif)](https://gyazo.com/bff7de36547590760568223823a46724)

<br>

## 推し本の共有(投稿機能)
[![Image from Gyazo](https://i.gyazo.com/2656b0549e60d8b06e891c0a1738df18.png)](https://gyazo.com/2656b0549e60d8b06e891c0a1738df18)
タグは複数の入力が可能。<br>
フォームオブジェクトを活用し、投稿ボタンを押すと、BookモデルとTagモデルに保存されます。
<br>
<br>

## 詳細ページ
[![Image from Gyazo](https://i.gyazo.com/79aac1c6196aef91f78b66d922b7228d.gif)](https://gyazo.com/79aac1c6196aef91f78b66d922b7228d)
投稿をクリックすることで詳細ページに遷移します。
投稿者本人は詳細ページから投稿の編集、削除が行えます。
<br>
<br>

## お気に入り登録、解除機能
[![Image from Gyazo](https://i.gyazo.com/a47a81c349ca965df66571fde2022f2a.gif)](https://gyazo.com/a47a81c349ca965df66571fde2022f2a)
非同期通信を用いて、お気に入り登録、解除機能を実装しました。<br>
ログインしている状態かつ、投稿者以外が登録できます。
<br>
<br>

## 読みたい本の一覧表示
[![Image from Gyazo](https://i.gyazo.com/e660d5deddbba48af79ffc16c2101fe8.gif)](https://gyazo.com/e660d5deddbba48af79ffc16c2101fe8)
トップページ右下の読みたいボタンを押すと、お気に入り登録した本の一覧が表示されます。
<br>
<br>

## 推し本の記録
[![Image from Gyazo](https://i.gyazo.com/adefbf1d6557f4e5242e4f20f14ec9e6.gif)](https://gyazo.com/adefbf1d6557f4e5242e4f20f14ec9e6)
ヘッダーのユーザー名をクリックすると、自分の投稿一覧を見ることができます。
<br>
<br>

# 実装予定の機能
1. Google Books APIの利用(本の検索、データを取得、表示)<br>
→投稿の入力を簡単に
2. タグ検索機能<br>
→より効率的に本に出会える
3. レスポンシブ対応<br>
→仕事の通勤・休憩時間など、ちょっとした時間を使って本を見つけたい
<br>
<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/1e2328ccd5e890c6cf77e6553b601cdf.png)](https://gyazo.com/1e2328ccd5e890c6cf77e6553b601cdf)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/fb23057b15e3a44c04dc4f17e7802124.png)](https://gyazo.com/fb23057b15e3a44c04dc4f17e7802124)
<br>
<br>

# 開発環境
- フロントエンド　Ruby、HTML、css、jQuery
- バックエンド　Ruby、Ruby on Rails
- インフラ　AWS(EC2,MySQL,Unicorn,Nginx)
- テスト　RSpec、Faker
- テキストエディタ　VS Code
- タスク管理　lssues(GitHub)
<br>
<br>

# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://github.com/eri0730/encounter_books.git<br>
% cd encounter_books<br>
% bundle install<br>
% yarn install<br>
<br>
<br>

# 工夫したポイント
「新しい本に出会える」ということに、重きをおいたアプリケーションにしたいと作成しました。<br>
1. 一覧ページの表示
[![Image from Gyazo](https://i.gyazo.com/ed0e80d976e6956657fb09c2a53164a1.jpg)](https://gyazo.com/ed0e80d976e6956657fb09c2a53164a1)
一覧ページでの表示は、本タイトル、おすすめ文、タグ、画像とあえてシンプルに。あらすじだけではスルーしていまう作品も、おすすめ文とタグによって、インスピレーションでお気に入り登録ができたらと思いました。<br>
こうすることで、普段自分では手に取らない本にも興味を持つことができ、実は面白い本に出会うことができる！という狙いです。<br>
<br>

2. お気に入り登録
[![Image from Gyazo](https://i.gyazo.com/be8a3f9157b86568d614d0891dedd67b.gif)](https://gyazo.com/be8a3f9157b86568d614d0891dedd67b)
一覧ページでも直感的に読みたいと思った本を、お気に入り登録ができます。
お気に入り一覧ページの充実に繋がり、これからの読者が楽しみに！！

3. おすすめ文の投稿
[![Image from Gyazo](https://i.gyazo.com/3ea7ecd51b7e3f42121e31b7f285603f.png)](https://gyazo.com/3ea7ecd51b7e3f42121e31b7f285603f)
[![Image from Gyazo](https://i.gyazo.com/65a818d95c564549553e69e542552d7b.png)](https://gyazo.com/65a818d95c564549553e69e542552d7b)
おすすめ文の入力にあえて80文字の制限をかけています。<br>
→推し本を紹介するための、シンプルで考え抜かれた文章を投稿！<br>
<br>




<!-- # テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null:false                |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
  
### Association

- has_many :books
- has_many :favorites
- has_many :favorite_books, through: :favorites, source: :book



## books テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| author           | string     | null: false                    |
| summary          | text       | null: false                    |
| recommend        | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :book_tag_relations, dependent: :destroy
- has_many :tags, through: :book_tag_relations, dependent: :destroy
- has_many :favorites, dependent: :destroy



## tags テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| tag_name  | string     | null: false, uniqueness: true  |

### Association

- has_many :book_tag_relations
- has_many :books, through: :book_tag_relations



## book_tag_relations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| book             | references | foreign_key: true              |
| tag              | references | foreign_key: true              |

### Association

- belongs_to :book
- belongs_to :tag



## favoritesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| book           | references | null: false, foreign_key: true |

<!-- add_index :favorites, [:user_id, :book_id], unique: true  # 同じユーザが2回お気に入りできないようにする -->    

<!-- ### Association

- belongs_to :user
- belongs_to :book --> 

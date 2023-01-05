# テーブル設計

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

### Association

- belongs_to :user
- belongs_to :book

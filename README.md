# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# usersテーブル

| Column   | Type   | Option                                  |
| -------- | ------ | --------------------------------------- |
| nickname | string | null: false                             |
| email    | string | null: false                             |
| password | string | null: false,  unique: true, index: true |

has_many :comments, dependent::destroy
has_one  :profile, dependent::destroy
has_one  :card, dependent::destroy
has_one  :address, dependent::destroy

# profileテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birth_year       | date       | null: false                    |
| birth_month      | date       | null: false                    |
| birth_day        | date       | null: false                    |
| user             | references | null: false, foreign_key: true |

belongs_to :user

# cardテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false, unique: true      |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

belongs_to :user

# addressテーブル
| Column                       | Type       | Option                         |
| ---------------------------- | ---------- | ------------------------------ |
| destination_first_name       | string     | null: false                    |
| destination_family_name      | string     | null: false                    |
| destination_first_name_kana  | string     | null: false                    |
| destination_family_name_kama | string     | null: false                    |
| post_code                    | integer(7) | null: false                    |
| prefecture                   | string     | null: false                    |
| city                         | string     | null: false                    |
| house_number                 | string     | null: false                    |
| building_name                | string     |                                |
| phone_number                 | integer    | unique: true                   |
| user                         | references | null: false, foreign_key: true |

belongs_to :user

# itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| image           | string     | null: false                    |
| price           | integer    | null: false                    |
| introduction    | text       | null: false                    |
| item_condition  | references | null: false, foreign_key: true |
| potage_payer    | references | null: false, foreign_key: true |
| prefecture      | references | null: false, foreign_key: true |
| preparation_day | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |
| brand           | reference  | foreign_key: true              |

belongs_to_active_hash :item_condition
belongs_to_active_hash :potage_payer
belongs_to_active_hash :prefecture
belongs_to_active_hash :preparation_day
belongs_to :category
belongs_to :brand
belongs_to :user
has_many :comments

# categoryテーブル

| Column   | Type   | Option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | null: false |

has_many :items

# brandテーブル
| Column | Type   | Option |
| ------ | ------ | ------ |
| name   | string |        |

has_many :items

# commentテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


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

| Column           | Type   | Option                                |
| ---------------- | ------ | ------------------------------------- |
| nickname         | string | null: false                           |
| email            | string | null: false, unique:true, index: true |
| password         | string | null: false                           |
| first_name       | string | null: false                           |
| family_name      | string | null: false                           |
| first_name_kana  | string | null: false                           |
| family_name_kana | string | null: false                           |
| birth_day        | date   | null: false                           |

has_many :items, dependent::destroy
has_many :comments, dependent::destroy
has_many :item_purchases

# addressテーブル
| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefecture        | integer    | null: false                    |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | unique: true                   |
| item_purchase     | references | null: false, foreign_key: true |

belongs_to_active_hash :prefecture
belongs_to :item_purchase 

# itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| image           | string     | null: false                    |
| price           | integer    | null: false                    |
| introduction    | text       | null: false                    |
| item_condition  | integer    | null: false                    |
| potage_payer    | integer    | null: false                    |
| prefecture      | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| category        | integer    | null: false                    |
| brand           | integer    | null: false                    |

belongs_to_active_hash :item_condition
belongs_to_active_hash :potage_payer
belongs_to_active_hash :prefecture
belongs_to_active_hash :preparation_day
belongs_to_active_hash :category
belongs_to_active_hash :brand
belongs_to :item_purchases
belongs_to :user
has_many :comments


# commentテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item

# item_purchases テーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address
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

# データベース設計

## usersテーブル

| Column                | Type   | Option                    |
|-----------------------|--------|---------------------------|
| name                  | string | null: false               |
| division              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| confirmation_password | string | null: false               |

### Association

- has_many :items

## itemsテーブル
| Column      | Type       | Option                         |
|-------------|------------|--------------------------------|
| name        | string     | null: false                    |
| category_id | integer    | null: false                    |
| quantity    | integer    | null: false                    |
| order_point | integer    | null: false                    |
| store       | string     |                                |
| location    | string     |                                |
| unit        | string     |                                |
| remarks     | text       |                                |
| users_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :stocks
- has_many :ships

## stocksテーブル
| Column   | Type       | Option                         |
|----------|------------|--------------------------------|
| item_id  | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |

### Association
- belongs_to :item

## shipsテーブル
| Column   | Type       | Option                         |
|----------|------------|--------------------------------|
| item_id  | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |

### Association
- belongs_to :item
# Pickup!

# 概要
備品の入出庫管理をすることを目的としています。
また、管理者と登録したユーザーのみ、備品の情報を登録することができ、現在の備品在庫数も表示することが可能です。備品の欠品を防ぐ発注点通知機能も実装しています。

# URL
https://pickup-37875.herokuapp.com/  

ID: admin  
Pass: 2222 

# テスト用アカウント
メールアドレス: abc@def  
Pass: aaa111

# 利用方法
[実装した機能についての説明](https://docs.google.com/document/d/1An2tsO8UCKto7qj0SUY7FnnOyZrZkNn_vhxTLj55RbE/edit)

# アプリケーションを作成した背景
私の前職が工場勤務であり、その経験がきっかけで作ったアプリです。工場では、多くの消耗備品があり、欠品すると生産予定に影響があります。 備品の管理は手間がかかリますが、生産性がある仕事ではないため、出来るだけ簡単で、手間がかからない仕組みを必要としていました。
これを解決したいという思いから、アプリを作成しました。


# 洗い出した要件
[要件定義スプレッドシート](
https://docs.google.com/spreadsheets/d/18O7u01SY70OO5n1dkmihfkJtZtJRERq1Irkzj67LHRs/edit#gid=982722306)

# 実装予定の機能
- SwiftUIを用いたiOS機器での操作
  - QRコードの読み取りにより、入出庫する備品を選択できるようにする。
  - 登録備品一覧を閲覧できるようにする。
- 備品発注点に達した備品の発注書を自動発行する機能

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
| Column      | Type    | Option      |
|-------------|---------|-------------|
| name        | string  | null: false |
| category_id | integer | null: false |
| quantity    | integer | null: false |
| order_point | integer | null: false |
| store       | string  |             |
| location    | string  |             |
| unit        | string  |             |
| remarks     | text    |             |

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

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/2e41fdc756b324e9b25b9ab63504fb6b.png)](https://gyazo.com/2e41fdc756b324e9b25b9ab63504fb6b)

# 開発環境
- バックエンド: &nbsp;Ruby on Rails, MySQL
- フロントエンド: &nbsp;HTML, CSS, JavaScript
- タスク管理: &nbsp;GitHub
- テキストエディタ: &nbsp;Visual Studio Code

# ローカルでの動作方法
% git clone https://github.com/hizaoni/pickup.git  
% cd pickup  
% bundle install  
% yarn install

# 工夫したポイント
- 操作性優先、トラブル防止のため装飾は最低限のものとしました。
- 多くの備品を管理することを想定し、カテゴリーによる絞り込みを行う機能を実装し、検索の簡便化を図りました。


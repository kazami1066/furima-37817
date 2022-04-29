# テーブル設計

<!-- usersテーブル -->
##users

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_date      | date   | nill: false               |

### Association
- has_many :items
- has_one :order

<!-- itemsテーブル -->
## items

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| price               | integer    | null: false                    |
| user                | references | nill: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shipping address
- has_one :order



<!-- ordersテーブル -->
## orders

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :item

<!-- shipping addressesテーブル -->
## shipping addresses

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false, unique: true      |
| item_id      | references | nill: false, foreign_key: true |

### Association

- belongs_to :item
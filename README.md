# テーブル設計

<!-- usersテーブル -->
##users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | nill: false               |

### Association

- has_many :items
- has_many :orders

<!-- itemsテーブル -->
## items

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_info                | text       | null: false                    |
| price                    | integer    | null: false                    |
| item_category            | integer    | null: false                    |
| item_sales_status        | integer    | null: false                    |
| item_shipping_fee_status | integer    | null: false                    |
| item_prefecture          | integer    | null: false                    |
| item_scheduled_delivery  | integer    | null: false                    |
| user                     | references | nill: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



<!-- ordersテーブル -->
## orders

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :item
- has_one :shipping address


<!-- shipping addressesテーブル -->
## shipping addresses

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false, unique: true      |
| order         | references | nill: false, foreign_key: true |

### Association

- belongs_to :order
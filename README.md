# テーブル設計

##users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | nill: false               |

### Association
- has_many :items
- has_one :order

## items

| Column       | Type         | Options                        |
| ------------ | ------------ | ------------------------------ |
| name         | string       | null: false                    |
| info         | text         | null: false                    |
| category     | string       | null: false                    |
| sales_status | string       | null: false                    |
| price        | string       | null: false                    |
| user         | references   | nill: false, foreign_key: true |

### Association

- belongs_to :user

## orders

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false, unique: true      |
| user         | references | nill: false, foreign_key: true |

### Association

- belongs_to :user 

# README
# テーブル設計

## users テーブル
| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birth_date         | date    | null: false              |


### Association
- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル
| Column                | Type          | Options                        |
| --------------------- | ------------- | ------------------------------ |
| item_name             | string        | null: false                    |
| description           | text          | null: false                    |
| category_id           | integer       | null: false                    |
| condition_id          | integer       | null: false                    |
| postage_id            | integer       | null: false                    |
| prefecture_id         | integer       | null: false                    |
| delivery_time_id      | integer       | null: false                    |
| price                 | integer       | null: false                    |
| user                  | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase


## comments テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


### purchases テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


### addresses テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
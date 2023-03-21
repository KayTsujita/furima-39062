# README
# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| address            | text   | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル
| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| item_name          | string        | null: false                    |
| description        | text          | null: false                    |
| category           | integer       | null: false                    |
| condition          | integer       | null: false                    |
| postage            | integer       | null: false                    |
| area               | integer       | null: false                    |
| delivery_time      | integer       | null: false                    |
| image              | references    | null: false                    |
| user               | references    | null: false, foreign_key: true |

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
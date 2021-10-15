# DB 設計

## users table

| Column             | Type        | Options                      |
|--------------------|-------------|------------------------------|
| nickname           | string      | null: false                  |
| email              | string      | null: false, unique: true    |
| encrypted_password | string      | null: false                  |
| last_name          | string      | null: false                  |
| first_name         | string      | null: false                  |
| birth              | date        | null: false                  |
| last_name_kana     | string      | null: false                  |
| first_name_kana    | string      | null: false                  |

### Association

* has_many :items
* has_many :orders

## items table

| Column        | Type        | Options                         |
|---------------|-------------|---------------------------------|
| name          | string      | null: false                     |
| explanation   | text        | null: false                     |
| category_id   | integer     | null: false                     |
| state_id      | integer     | null: false                     |
| fee_id        | integer     | null: false                     |
| area_id        | integer     | null: false                     |
| delivery_day_id       | integer     | null: false                     |
| price         | integer     | null: false                     |
| user          | references  | null: false,foreign_key: true   |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type         | Options                          |
|-------------|--------------|----------------------------------|
| user        | references   | null: false,foreign_key: true    |
| item        | references   | null: false,foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses table

| Column      | Type         | Options                         |
|-------------|--------------|---------------------------------|
| code        | string       | null: false                     |
| area_id     | integer      | null: false                     |
| muni        | string       | null: false                     |
| address     | string       | null: false                     |
| building    | string       |                                 |
| phone       | string       | null: false                     |
| order       | references    | null: false,foreign_key: true   |

### Association

- belongs_to :order

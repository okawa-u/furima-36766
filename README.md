# DB 設計

## users table

| Column             | Type        | Options                      |
|--------------------|-------------|------------------------------|
| nickname           | string      | null: false                  |
| email              | string      | null: false, unique: true    |
| encrypted_password | string      | null: false                  |
| last name          | string      | null: false                  |
| first name         | string      | null: false                  |
| birth              | date        | null: false                  |
| last name kana     | string      | null: false                  |
| first name kana    | string      | null: false                  |

### Association

* has_many :items
* has_many :orders

## items table

| Column        | Type        | Options                         |
|---------------|-------------|---------------------------------|
| name          | string      | null: false                     |
| explanation   | string      | null: false                     |
| category_id   | integer     | null: false                     |
| state_id      | integer     | null: false                     |
| fee_id        | integer     | null: false                     |
| area_id       | integer     | null: false                     |
| date_id       | integer     | null: false                     |
| price         | string      | null: false                     |
| user          | reference   | null: false,foreign_key: true   |

### Association

- belongs_to :user
- has_one :orders

## orders table

| Column      | Type         | Options                          |
|-------------|--------------|----------------------------------|
| user        | reference    | null: false,foreign_key: true    |
| item        | reference    | null: false,foreign_key: true    |

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
| order       | reference    | null: false,foreign_key: true   |

### Association

- belongs_to :orders
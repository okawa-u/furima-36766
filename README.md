# DB 設計

## users table

| Column             | Type        | Options                      |
|--------------------|-------------|------------------------------|
| nickname           | string      | null: false                  |
| email              | string      | null: false, unique: true    |
| encrypted_password | string      | null: false                  |
| Last name               | string      | null: false                  |
| First name               | string      | null: false                  |
| birth              | date        | null: false                  |
| Last name kana               | string      | null: false                  |
| First name kana               | string      | null: false                  |

### Association

* has_many :items
* has_many :purchases

## items table

| Column        | Type        | Options             |
|---------------|-------------|---------------------|
| name          | string      | null: false         |
| explanation   | string      | null: false         |
| category_id      | integer      | null: false         |
| state_id         | integer      | null: false         |
| fee_id           | integer      | null: false         |
| area_id          | integer      | null: false         |
| date_id          | integer      | null: false         |
| price         | string      | null: false         |
| user          | reference   | foreign_key: true   |

### Association

- belongs_to :user
- has_one :purchase

## orders table

| Column      | Type         | Options              |
|-------------|--------------|----------------------|
| user        | reference    | foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses table

| Column      | Type         | Options             |
|-------------|--------------|---------------------|
| code        | string       | null: false         |
| area_id     | string       | null: false         |
| muni        | string       | null: false         |
| address     | string       | null: false         |
| building    | string       | null: false         |
| phone       | string       | null: false         |
| user        | reference    | foreign_key: true   |

### Association

- belongs_to :purchase
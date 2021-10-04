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
| image         | string      | null: false         |
| explanation   | string      | null: false         |
| category      | string      | null: false         |
| state         | string      | null: false         |
| fee           | string      | null: false         |
| area          | string      | null: false         |
| date          | string      | null: false         |
| price         | string      | null: false         |
| user          | reference   | foreign_key: true   |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

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
| prefecture  | string       | null: false         |
| muni        | string       | null: false         |
| address     | string       | null: false         |
| building    | string       | null: false         |
| phone       | string       | null: false         |
| user        | reference    | foreign_key: true   |

### Association

- belongs_to :purchase
# テーブル設計

## usersテーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false, maxlength: 40 |
| email             | string | null: false |
| password          | string | null: false |
| first-name        | string | null: false |
| last-name         | string | null: false |
| first-name-kana   | string | null: false |
| last-name-kana    | string | null: false |
| user_birth_year   |        | ActiveHash  |
| user_birth_ month |        | ActiveHash  |
| user_birth_day    |        | ActiveHash  |

### Association

has_many :items
has_one  :purchase


## itemsテーブル

| Column            | Type       | Options     |
| --------          | ------     | ----------- |
| name              | string     | null: false, maxlength: 40 |
| information       | text       | null: false  maxlength: 1000 |
| price             | integer    | null: false |
| user              | references | null: false |
| category          |            | ActiveHash  |
| status            |            | ActiveHash  |
| delivery-fee      |            | ActiveHash  |
| delivery-date     |            | ActiveHash  |
| prefecture        |            | ActiveHash  |
| image             |            | ActiveStorage |

### Association

belongs_to :user
has_one    :purchase

## purchasesテーブル

| Column            | Type       | Options     |
| --------          | ------     | ----------- |
| card-number       | bight      | null: false, maxlength: 16 |
| card-month        | integer    | null: false, maxlength: 2 |
| card-year         | integer    | null: false, maxlength: 2 |
| card-cvc          | integer    | null: false, maxlength: 4 |
| postal-code       | integer    | null: false, maxlength: 8 |
| city              | string     | null: false |
| addresses         | string     | null: false |
| building          | string     | null: false |
| phone-number      | bight      | null: false, maxlength: 11 |
| user              | references |             |
| item              | references |             |
| prefecture        |            | ActiveHash  |

### Association

belongs_to :user
belongs_to :item




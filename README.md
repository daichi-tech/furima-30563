# テーブル設計

## usersテーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false, maxlength: 40 |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birthday          | date   | null: false |

### Association

has_many :items
has_many :purchases
has_one  :address


## itemsテーブル

| Column            | Type       | Options     |
| --------          | ------     | ----------- |
| name              | string     | null: false, maxlength: 40 |
| information       | text       | null: false  maxlength: 1000 |
| price             | integer    | null: false |
| user_id           | references | null: false |
| category          | integer    | null: false, ActiveHash  |
| status            | integer    | null: false, ActiveHash  |
| delivery_fee      | integer    | null: false, ActiveHash  |
| delivery_date     | integer    | null: false, ActiveHash  |
| prefecture        | integer    | null: false, ActiveHash  |
| image             | text       | null: false, ActiveStorage |

### Association

belongs_to :user
has_one    :purchase

## purchasesテーブル

| Column            | Type       | Options     |
| --------          | ------     | ----------- |
| user_id           | references | null: false |
| item_id           | references | null: false |


### Association

belongs_to :user
belongs_to :item


## addressesテーブル

| Column            | Type       | Options     |
| ----------        | -------    | ----------- |
| postal_code       | integer    | null: false, maxlength: 8 |
| city              | string     | null: false |
| addresses         | string     | null: false |
| building          | string     | null: false |
| phone_number      | bight      | null: false, maxlength: 11 |
| user_id           | references | null: false |
| prefecture        | integer    | ActiveHash  |

### Association

belongs_to :user

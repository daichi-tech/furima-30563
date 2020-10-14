# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false, maxlength: 40 |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

has_many :items
has_many :purchases


## itemsテーブル

| Column            | Type       | Options     |
| --------          | ------     | ----------- |
| name              | string     | null: false, maxlength: 40 |
| information       | text       | null: false  maxlength: 1000 |
| price             | integer    | null: false |
| user              | references | null: false |
| category_id       | integer    | null: false, ActiveHash  |
| status_id         | integer    | null: false, ActiveHash  |
| delivery_fee_id   | integer    | null: false, ActiveHash  |
| delivery_date_id  | integer    | null: false, ActiveHash  |
| prefecture_id     | integer    | null: false, ActiveHash  |
| image             | text       | null: false, ActiveStorage |

### Association

belongs_to :user
has_one    :purchase

## purchasesテーブル

| Column            | Type       | Options     |
| --------          | ------     | ----------- |
| user              | references | null: false |
| item              | references | null: false |


### Association

belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル

| Column            | Type       | Options     |
| ----------        | -------    | ----------- |
| postal_code       | string     | null: false, maxlength: 8 |
| city              | string     | null: false |
| addresses         | string     | null: false |
| building          | string     | null: false |
| phone_number      | bight      | null: false, maxlength: 11 |
| purchase          | references | null: false |
| prefecture_id     | integer    | null: false, ActiveHash |

### Association

belongs_to :purchase

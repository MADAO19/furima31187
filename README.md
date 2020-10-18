# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| namekana | string | null: false |
| birthday | date   | null: false |

### Association

- has_many :items
- has_many :purchase


## items テーブル

| Column          | Type   | Options     |
| ------          | ------ | ----------- |
| image           |        |             |
| itemname        | string | null: false |
| itemdescription | text   | null: false |
| itemdetails     | string | null: false |
| delivery        | string | null: false |
| itemvalue       | string | null: false |

### Association

- belongs_to :user
- has_many :comments

## purchase テーブル

| Column             | Type   | Options     |
| ------             | ------ | -------     | 
| cardinformation    | string | null: false |
| expiration date    | string | null: false |
| security code      | string | null: false |
| postal code        | string | null: false |
| prefectures        | string | null: false |
| municipal District | string | null: false |
| address            | string | null: false | 
| building name      | string | null: false |
| phone number       | string | null: false |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column  | Type       | Options |
| ------- | ---------- | ------- |
| text    | text       | null: false |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :purchase
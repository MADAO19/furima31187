# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| last_name     | string | null: false |
| name          | string | null: false |
| last_name_kana | string | null: false |
| name_kana      | string | null: false |
| birthday      | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options     |
| ------            | ------     | ----------- |
| itemname          | string     | null: false |
| itemdescription   | text       | null: false |
| itemcategory_id   | integer    | null: false |
| itemstatus_id     | integer    | null: false |
| deliverycharge_id | integer    | null: false |
| prefectures_id    | integer    | null: false |
| daystoship_id     | integer    | null: false |
| itemvalue_id      | string     | null: false |
| user              | references | null: false foreign_key: true |
|

### Association

- belongs_to :user
- has_many :comments

## purchase テーブル

| Column             | Type    | Options     |
| ------             | ------  | -------     | 
| postal_code        | string  | null: false |
| prefectures_id     | integer | null: false |
| municipal_district | string  | null: false |
| address            | string  | null: false | 
| building_name      | string  |             |
| phone_number       | string  | null: false |
| user               | references | null: false foreign_key: true 

### Association

- has_many :comments
- belongs_to :user
- belongs_to :purchase after

## comments テーブル

| Column  | Type       | Options |
| ------- | ---------- | ------- |
| text    | text       | null: false |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :purchase

## purchase after テーブル

| Column  | Type       | Options                     |
| ------- | ---------- | --------------------------- |
| user    | references | null: false foreign_key: true |
| item    | references | null: false foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :purchase
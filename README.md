# README
## 海外出張の管理アプリ

## 概要
- 海外出張の見積から予約・発券依頼ができ、社内稟議決裁をあげる機能や帰国後の出張精算ができるアプリ
- 権限が与えられた一部のユーザー（上司）には出張者の出張情報の確認・管理ができ、危機管理や稟議決済の可否が行える。
- 出張手続きフローの一元化でuserにとって一つのシステムで全てが完結できるメリットがあり、かつ、管理者は出張者の管理や危機管理を行えるという点を目的としたアプリ。

## 本番環境
  - AWSでデプロイ　http://54.64.229.114/

## 制作背景
 - 現在社内で使用しているシステムにこういう機能があったらもっと効率化が勧められて、かつ、サービス向上に繋がるのではないかと考えた。
 - 

## テーブル

bookingテーブル
|Column|Type|Options|
|------|----|-------|
|country|string|null: false|
|flight_classtion|string|null: false|
|departure_day|data|null: false|
|departure|string|null: false|
|destination|string|null: false|
|flight_classtion|string|null: false|
|departure_day|date|null: false|
|return_day|date|null: false|
|hotel|string|null: false|
|remarks|string|
|policy|string|
|airline|string|
|hotel_rate|string|
|issue|string|
|user_id|integer|
|estimate_id|integer|


Userテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|passport_number|string|null: false|
|passport_valid|data|null: false|
|mileage|string|
|seat_request|string|
|admin_flg|boolean|


decisionsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|purpose|string|null: false|
|rate|string|null: false|
|application_date|date|null: false|
|approval|boolean|
|authorizer|string|
|user_id|bigint|
|booking_id|bigint|
|mileage|string|
|seat_request|string|
|admin_flg|boolean|


expensesテーブル
|Column|Type|Options|
|------|----|-------|
|application_date|date|null: false|
|travel_cost|string|null: false|
|approver|string|
|completed|date|
|approval|string|
|decision_id|string|
|user_id|bigint |
|booking_id|bigint|


## 工夫したポイント
 - ユーザビリティーを考え、AJAXを取り入れた実装を行った。（非同期通信・インクリメンタルサーチ機能）

## 開発環境
RAILS JQUERY (ruby2.5.1 rails5.2.4)

## 課題や今後実装したい機能
複数検索機能の追加

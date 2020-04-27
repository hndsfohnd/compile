# README
## 海外出張一元化アプリ

## 概要
- 海外出張の見積から予約・発券依頼ができ、社内稟議決裁をあげる機能や帰国後の出張精算ができるアプリ
- 権限が与えられた一部のユーザー（管理者）には出張者の出張情報の確認・管理ができ、危機管理や稟議決済の可否が行える。
- 出張手続きフローの一元化でuserにとって一つのシステムで全てが完結できるメリットがあり、かつ、管理者は出張者の危機管理等を行えるという点を目的としたアプリ。


## 制作背景
 - 現在社内で使用しているシステムのさらなる効率化とサービス向上を目的に作成しました。
 
## 実装ポイント

トップページイメージ画像
　- 社内システムを想定してシンプルな色使いと分かりやすさを意識したviewの実装

<img src="https://user-images.githubusercontent.com/54070603/79982407-40ecf300-84e1-11ea-8296-fdae78b9114a.png" width="65%" height="65%">

予約依頼画面イメージ画像
　- 日付のバリテーション・渡航国を選択するとパスポートの残存やVISAの注意文が表示されるように実装した
<img src="https://user-images.githubusercontent.com/54070603/80312272-4028c980-881f-11ea-8356-0b2f52389233.png" width="65%" height="65%">

稟議トップページイメージ画像
　- 申請済・未申請・申請中の詳細が確認できる
<img src="https://user-images.githubusercontent.com/54070603/80323983-5196c380-8869-11ea-9b54-2b4df0d9ebad.png" width="65%" height="65%">

## 本番環境
  - AWSでデプロイ　http://54.64.229.114/


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
|email|string|null: false,unique: true|
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


expenseテーブル
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

receiptテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|expense_id|bigint|


## ポイント
 - 管理者側のページはgem(admin-rails)を利用して実装
 - gem（rails_admin、country_select）やバリデーションを含め、全て日本語で表記
 - バリデーション（パスワード・日付）の実装

## 開発環境
ruby2.5.1 
rails5.2.4


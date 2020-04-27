# README
## 海外出張一元化アプリ

## 概要
- 海外出張の見積から予約・発券依頼ができ、社内稟議決裁をあげる機能や帰国後の出張精算ができるアプリ
- 権限が与えられた一部のユーザー（管理者）には出張者の出張情報の確認・管理ができ、危機管理や稟議決済の可否が行える。



## 制作背景
 - 現在社内で使用しているシステムのさらなる効率化とサービス向上ができないかと考え作成した。
 - 出張手続きフローの一元化でuserにとって一つのシステムで全てが完結できるメリットがあり、かつ、管理者は出張者の危機管理等を行えるという点を目的としたアプリ
 
## 本番環境
  - AWSでデプロイ　http://54.64.229.114/
 - 管理者用アカウント　email: test@test.co.jp    　 password: test123
 - 一般アカウント　　　email: test1@test.co.jp    　 password: test123

## 実装ポイント

トップページイメージ画像(管理者画面)
　- 社内システムを想定してシンプルな色使いと分かりやすさを意識したview

<img src="https://user-images.githubusercontent.com/54070603/79982407-40ecf300-84e1-11ea-8296-fdae78b9114a.png" width="65%" height="65%">
<br>
<br>

予約依頼画面イメージ画像
　- 日付のバリテーション・渡航国を選択するとパスポートの残存やVISAの注意文が表示される
<br>

<img src="https://user-images.githubusercontent.com/54070603/80312272-4028c980-881f-11ea-8356-0b2f52389233.png" width="65%" height="65%">
<br>
<br>

稟議トップページイメージ画像
　- 申請済・未申請・申請中の詳細が確認できる
<img src="https://user-images.githubusercontent.com/54070603/80323983-5196c380-8869-11ea-9b54-2b4df0d9ebad.png" width="65%" height="65%">
<br>
<br>

精算トップページイメージ画像
　- 帰国後の精算の申請状況が確認できる
<img src="https://user-images.githubusercontent.com/54070603/80334729-07bfd480-888d-11ea-8e7a-ada9eb38ff98.png" width="65%" height="65%">
<br>
<br>

精算申請ページイメージ画像
　- 領収書の添付をして申請することができる（Jqueryを用いた実装）
<img src="https://user-images.githubusercontent.com/54070603/80334967-d1cf2000-888d-11ea-8f09-4d0fec7196b7.png" width="65%" height="65%">
<br>
<br>
<br>
<br>
管理画面イメージ画像
- rails_admin(gem)を用いて実装
- rails_adminも含めて全て日本語化にして実装
<img src="https://user-images.githubusercontent.com/54070603/80335292-d1835480-888e-11ea-9ac7-ae4749064b3c.png" width="65%" height="65%">


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


## 開発環境
ruby2.5.1 
rails5.2.4


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## ## DB 設計

## user table
______________________________________________________________________
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|nickname            |string               |null: false,index: true  |
|email               |string               |null: false              |
|encrypted_password  |string               |null: false              |
|rent                |integer              |null: false              |
|utility_costs       |integer              |null: false              |
|phone               |integer              |null: false              |
|--------------------|---------------------|-------------------------|

### Association

* has_many :salary
* has_many :cost

## salary table

______________________________________________________________________
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|salary              |integer              |null: false              |
|user(FK)            | references          |foreign_key: true        |
|--------------------|---------------------|-------------------------|

### Association

* has_many :cost
* belongs_to :user

## cost table
______________________________________________________________________
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|food expenses       |integer              |null: false              |
|expenses            |integer              |null: false              |
|expenses_name       |string               |null: false              |
|salary(FK)          | references          | foreign_key: true       |
|--------------------|---------------------|-------------------------|

### Association

* belongs_to :salary


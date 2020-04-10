class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :estimates
  has_many :bookings
  has_one  :decision
  has_many :expenses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         number = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}+\z/i
         validates :password, presence: true,length: { minimum: 6 }  , format: { with: number }
         validates :lastname, presence: true
         validates :firstname, presence: true
         validates :firstname_kana, presence: true
         validates :lastname_kana, presence: true
         validates :birthday, presence: true
         validates :email, presence: true
         validates :passport_number, presence: true, uniqueness: true
         validates :passport_valid, presence: true
         
end

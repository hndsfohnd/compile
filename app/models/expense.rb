class Expense < ApplicationRecord
  has_many :users 
  belongs_to :decision, optional: true
  belongs_to :booking, optional: true

  has_many  :receipts, dependent: :destroy
  accepts_nested_attributes_for :receipts

  validates :application_date, presence: true
  validates :travel_cost, presence: true


end

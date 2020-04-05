class Decision < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :estimate, optional: true
  belongs_to :user
  has_one :expense
  validates :title, presence: true
  validates :purpose, presence: true
  validates :rate, presence: true
  validates :application_date, presence: true


end

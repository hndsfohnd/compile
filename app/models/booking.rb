class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :estimate, optional: true
  has_many :expenses
  has_one :decision
  accepts_nested_attributes_for :decision

  validates :country, presence: true
  validates :flight_class, presence: true
  validates :departure, presence: true
  validates :departure_day, presence: true
  validates :destination, presence: true
  validates :return_day, presence: true
  validates :hotel, presence: true
  validate  :date_not_before_today
  validate  :date_not_before_departureday
  
  def date_not_before_today
    errors.add(:departure_day, "は今日以降のものを選択してください") if departure_day.nil? || departure_day < Date.today
  end

  def date_not_before_departureday
    errors.add(:return_day, "は出発日以降を選択してください") if return_day.nil? || return_day < departure_day
  end

end

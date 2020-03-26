class LunchPackage < ApplicationRecord
  validates :month, presence: true

  belongs_to :user
  belongs_to :meal

  scope :last_month_meals, ->(user) { where(user_id: user, month: Date::MONTHNAMES[Date.today.month]) }

  enum month: {
    January: 1, 
    February: 2, 
    March: 3,
    April: 4, 
    May: 5, 
    June: 6,
    July: 7,
    August:8, 
    September: 9,
    Octobre: 10,
    November: 11,
    December: 12
  }
end

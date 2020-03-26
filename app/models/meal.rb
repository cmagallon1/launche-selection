class Meal < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :lunch_packages
  has_many :users, through: :lunch_packages
  has_one_attached :image

  validate :image_type

  def image_type
    unless image.attached?
      errors.add(:image, "is missing!")
    else 
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, "needs to be a jpeg or png!")
      end
    end
  end
end

class Review < ApplicationRecord
  NUMBER = (0..5)

  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, inclusion: { in: NUMBER }, numericality: { only_integer: true }

end

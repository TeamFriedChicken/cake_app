class Genre < ApplicationRecord
  has_many :items

  validates :is_active, :name, presence: true
end
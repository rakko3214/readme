class Menu < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  belongs_to :user
  has_and_belongs_to_many :recipes
end

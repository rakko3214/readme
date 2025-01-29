class Recipe < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :cooking_time, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end

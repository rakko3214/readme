class Recipe < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :cooking_time, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def self.ransackable_attributes(auth_object = nil)
    [ "avatar", "content", "cooking_time", "created_at", "id", "ingredient", "title", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "favorites", "user" ]
  end
end

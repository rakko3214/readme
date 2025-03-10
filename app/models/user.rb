class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :menus, dependent: :destroy
  has_many :menu_recipes, through: :menus, source: :recipe

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def own?(object)
    object = object.first if object.is_a?(ActiveRecord::Relation)
    id == object&.user_id
  end

  def favorite(recipe)
    favorite_recipes << recipe
  end

  def unfavorite(recipe)
    favorite_recipes.destroy(recipe)
  end

  def favorite?(recipe)
    favorite_recipes.include?(recipe)
  end
end

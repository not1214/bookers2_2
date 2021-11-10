class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  with_options presence: true do
    validates :title
    validates :body
  end
  
  def already_favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

end

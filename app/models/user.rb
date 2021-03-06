class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
  
  validates :name, presence: true, uniqueness: true, length:{ in: 2..20 }
  validates :introduction, length: { maximum: 50 }


  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user
end



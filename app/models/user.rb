class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # :validatabley

  has_many :books, dependent: :destroy
  attachment :profile_image
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2, maximum: 20}
  validates :introduction, length: { maximum: 50}
  validates :email, length: { maximum: 50}

end
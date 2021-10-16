class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # :validatabley

  has_many :book, dependent: :destroy, uniquness:true
  attachment :profile_image
  
  validates :name, presence: true, uniquness:true
  validates :email, length: { maximum: 50}

 #2行に一意制と文字数制限
end

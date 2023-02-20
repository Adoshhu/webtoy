class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true

    has_secure_password

    has_many :toy, dependent: :destroy

    has_one_attached :image 
    has_many_attached :pictures

   
   

end

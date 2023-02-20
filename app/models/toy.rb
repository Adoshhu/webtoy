class Toy < ApplicationRecord
    belongs_to :user
    validates :toyname, presence: true
    validates :content, length: { maximum: 140 }
    has_one_attached :image 
    has_many_attached :pictures

end

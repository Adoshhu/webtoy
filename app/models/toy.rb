class Toy < ApplicationRecord
    belongs_to :user
    validates :toyname, presence: true
    validates :content, length: { maximum: 140 }
end

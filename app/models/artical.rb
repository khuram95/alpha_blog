class Artical <ActiveRecord::Base
    has_many :artical_categories
    has_many :categories, through: :artical_categories
    belongs_to :user
    validates :title , presence: true , length: {minimum: 3 , maximum: 100 }
    validates :description , presence: true , length:  {minimum: 5 , maximum: 2000 }
    validates :user_id, presence: true
end
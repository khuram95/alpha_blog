class Category < ActiveRecord::Base 

# (if Rails 5 -> class Category < ApplicationRecord)
    has_many :artical_categories
    has_many :articals, through: :artical_categories
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    
    validates_uniqueness_of :name

end
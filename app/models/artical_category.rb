class ArticalCategory < ActiveRecord::Base
    belongs_to :artical
    belongs_to :category
end
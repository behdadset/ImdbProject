class Movie < ApplicationRecord
    has_and_belongs_to_many :favorites
    has_and_belongs_to_many :comments 
end

class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :taggings
  has_many :tags, through: :taggings
end

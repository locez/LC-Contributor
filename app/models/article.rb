class Article < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :category
end

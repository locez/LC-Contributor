class Article < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :article_type, presence: true

  VALID_URL_FORMAT = /\A\z|\A(http|https):\/\/\w+.*\..*\z/ 

  validates :source_url, format: { with: VALID_URL_FORMAT }
  validates :original_url, format: { with: VALID_URL_FORMAT }
end

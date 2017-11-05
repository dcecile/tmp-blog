class Tag < ApplicationRecord
  has_many :tagging, dependent: :destroy
  has_many :articles, through: :tagging
end

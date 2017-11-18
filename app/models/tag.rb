class Tag < ApplicationRecord
  has_many :tagging, dependent: :destroy
  has_many :articles, through: :tagging

  def articles_recent_order
    articles.order(created_at: :desc)
  end

  def self.lexicographical_order
    order(name: :asc)
  end
end

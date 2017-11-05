class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tagging, dependent: :destroy
  has_many :tags, through: :tagging

  def tag_list
    tags
      .map(&:name)
      .join(", ")
  end

  def tag_list=(list)
    tag_names = list.split(",").map(&:strip)
    self.tags =
      tag_names.map do |tag_name|
        Tag.find_or_create_by(name: tag_name)
      end
  end
end

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tagging, dependent: :destroy
  has_many :tags, through: :tagging
  has_attached_file :image, styles: { medium: "300x400>", thumb: "64x64>" }
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/png"]

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

  def comments_recent_order
    comments.order(created_at: :desc)
  end

  def self.recent_order
    order(created_at: :desc)
  end
end

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tagging, dependent: :destroy
  has_many :tags, through: :tagging
  has_attached_file(
    :image,
    styles: { medium: "300x400>" }
  )
  validates_attachment_content_type(
    :image,
    content_type: [
      "image/jpeg",
      "image/png",
      "image/gif",
      "image/svg+xml"
    ]
  )

  def body_paragraphs
    body
      .split(/\n\s*\n/)
      .map(&:strip)
  end

  def tag_list
    tags
      .map(&:name)
      .join(", ")
  end

  def tag_list=(list)
    tag_names =
      list
      .split(",")
      .map { |name| Tag.sanitize_name(name) }
      .reject(&:empty?)
      .uniq
    self.tags =
      tag_names.map do |tag_name|
        Tag.find_or_create_by(name: tag_name)
      end
  end

  def image_allowed_types
    all_validators = Article.validators_on(:image)
    content_type_validator = all_validators.find do |validator|
      validator.respond_to?(:allowed_types)
    end
    content_type_validator.allowed_types
  end

  def image_allowed_type_names
    image_allowed_types.map do |type|
      type.match(%r{/([^+]*)})[1].upcase
    end
  end

  def comments_recent_order
    comments.order(created_at: :desc)
  end

  def self.recent_order
    order(created_at: :desc)
  end
end

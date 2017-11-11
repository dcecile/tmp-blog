module ApplicationController::Scheduler
  def self.destroy_all_old
    destroy_all_items('articles', find_old_articles)
    destroy_all_items('tags', find_old_orphan_tags)
  end

  def self.find_old_articles
    find_old_items(Article)
  end

  def self.find_old_orphan_tags
    find_old_tags
      .select { |tag| tag.articles.size == 0 }
  end

  def self.find_old_tags
    find_old_items(Tag)
  end

  def self.find_old_items(item_class)
    item_class.where('created_at < ?', 24.hours.ago)
  end

  def self.destroy_all_items(name, items)
    items.each do |item|
      item.destroy
    end
    puts "Destroyed #{name}: #{items.size}"
  end
end

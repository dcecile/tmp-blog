class ApplicationController
  module Scheduler
    def self.destroy_all_old
      logger = Logger.new(STDOUT)
      destroy_all_items(logger, "articles", find_old_articles)
      destroy_all_items(logger, "tags", find_old_orphan_tags)
    end

    def self.find_old_articles
      find_old_items(Article)
    end

    def self.find_old_orphan_tags
      find_old_tags
        .select { |tag| tag.articles.empty? }
    end

    def self.find_old_tags
      find_old_items(Tag)
    end

    def self.find_old_items(item_class)
      item_class.where("created_at < ?", 24.hours.ago)
    end

    def self.destroy_all_items(logger, name, items)
      items.each(&:destroy)
      logger.info "Destroyed #{name}: #{items.size}"
    end
  end
end

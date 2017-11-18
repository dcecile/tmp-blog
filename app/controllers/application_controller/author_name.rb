class ApplicationController
  module AuthorName
    def merge_random_author_name!(params)
      params.merge!(
        author_name: generate_random_author_name
      )
    end

    private

    ADJECTIVES = %w[
      Red
      Orange
      Yellow
      Green
      Blue
      Purple
      Black
      White
      Magenta
      Cyan
      Emerald
      Ruby
      Sapphire
    ].freeze

    NOUNS = %w[
      Bear
      Bird
      Cat
      Dog
      Fox
      Hedgehog
      Lizard
      Mouse
      Panda
      Penguin
      Porcupine
      Snake
    ].freeze

    def generate_random_author_name
      "#{ADJECTIVES.sample} #{NOUNS.sample}"
    end
  end
end

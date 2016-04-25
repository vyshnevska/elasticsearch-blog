module Searchable
  extend ActiveSupport::Concern

  included do
    searchkick match: :word_start, searchable: [:title, :content], autocomplete: ['title']

    def search_data
      {
        title: title,
        content: content
      }
    end

    def self.custom_search(options)
      self.search(options[:query], misspellings: { below: 5 })
    end

    Article.reindex
  end
end

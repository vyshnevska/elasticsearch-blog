module Searchable
  extend ActiveSupport::Concern

  included do
    searchkick match: :word_start, searchable: [:title, :content], autocomplete: ['title']

    def self.custom_search(options)
      self.search(options[:query], misspellings: { below: 5 })
    end
    Article.reindex
  end
end

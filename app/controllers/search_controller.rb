class SearchController < ApplicationController
  respond_to :js, only: [:search]

  def search
    @articles = params[:q].presence ? Article.custom_search(query: params[:q]) : Article.all

    render 'components/search'
  end

  def autocomplete
    results = Article.search(params[:q], fields:[:title], limit: 10)

    render json: results.empty? ? "No item was found" : results.map(&:title)
  end
end

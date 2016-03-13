class SearchController < ApplicationController
  respond_to :js, only: [:search]

  def search
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q]
    end
    render 'components/search'
  end
end

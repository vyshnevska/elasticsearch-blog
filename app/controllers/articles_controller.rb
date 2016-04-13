class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def graph_data
    json_data = { links: [
                    { source: 1, target: 0, weight: rand(0..1.0) },
                    { source: 0, target: 2, weight: rand(0..1.0) },
                    { source: 3, target: 0, weight: rand(0..1.0) },
                    { source: 3, target: 1, weight: rand(0..1.0) }
                  ],
                  nodes: [
                    { label: "node 0", group: 1 },
                    { label: "node 1", group: 1 },
                    { label: "node 2", group: 2 },
                    { label: "node 3", group: 2 }
                  ],
                  labelAnchorLinks: [
                    { source: 0, target: 1, weight: 1 },
                    { source: 2, target: 3, weight: 1 },
                    { source: 4, target: 5, weight: 1 },
                    { source: 6, target: 7, weight: 1 }
                  ]
                }

    render json: json_data
  end

  private

  def article_params
    params.require(:article).permit :title, :content, :image
  end

end

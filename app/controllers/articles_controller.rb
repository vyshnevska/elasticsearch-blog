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

  def dots_chart
  end

  def dots_chart_data
    render json: [{
                    data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
                  }, {
                    data: [39.9, 31.5, 96.4, 29.2, 94.0, 176.0, 135.6, 198.5, 216.4, 94.1, 195.6, 4.4]
                  }]
  end

  def nodes_graph_data
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

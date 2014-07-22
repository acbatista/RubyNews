class ArticlesController < ApplicationController
  before_action :set_category

  def index
    @articles = @category.articles.limit(6)
  end

  def show
    @article = Article.find(params[:id])
    @related_articles = Article.all
  end

  private
    def set_category
      @category = Category.find(params[:category_id ])
    end
end

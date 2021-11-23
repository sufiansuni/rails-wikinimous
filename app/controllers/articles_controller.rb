class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @new_article = Article.new
  end

  def create
    new_article = Article.new(article_params)
    redirect_to article_path(new_article) if new_article.save
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    redirect_to article_path(article) if article.update(article_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

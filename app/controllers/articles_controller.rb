require 'kramdown'

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @markdown = Kramdown::Document.new(@article.title).to_html.html_safe
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.save
    redirect_to root_path
    # @article = Article.create(params_article)
  end

  def update
    @article.update(params_article)
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :content)
  end
end

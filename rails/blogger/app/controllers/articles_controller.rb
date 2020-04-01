class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  before_action :require_login, only: [:destroy, :new, :edit, :update, :create]

  def new
    @article = Article.new
  end

  # before_action :require_login, except: [:create, :edit, :update, :destroy]

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' created"

    redirect_to article_path(@article)
  end

  # before_action :require_login, except: [:create, :edit, :update, :destroy]

  def edit
    @article = Article.find(params[:id])
  end

  # before_action :require_login, except: [:create, :edit, :update, :destroy]

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  # before_action :require_login, except: [:create, :edit, :update, :destroy]

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' Deleted"

    redirect_to articles_path
  end
end

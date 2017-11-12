class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @article = Article.new.decorate
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to @article, notice: t('article.create.notice')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: t('article.update.notice')
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: t('article.destroy.notice')
  end

  private

  def set_article
    @article ||= Article.find(params[:id]).decorate
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end

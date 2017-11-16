class ArticlesController < BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    authorize! :read, @article
  end

  def new
    @article = Article.new.decorate
    authorize! :create, @article
  end

  def create
    @article = current_user.articles.create(article_params).decorate
    authorize! :create, @article
    if @article.valid?
      redirect_to @article, notice: t('article.create.notice')
    else
      render :new
    end
  end

  def edit
    authorize! :update, @article
  end

  def update
    authorize! :update, @article
    params = article_params.merge(user_id: current_user.id)
    if @article.update(params)
      redirect_to @article, notice: t('article.update.notice')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @article
    @article.destroy
    redirect_to feeds_url, notice: t('article.destroy.notice')
  end

  private

  def set_article
    @article ||= Article.find(params[:id]).decorate
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end

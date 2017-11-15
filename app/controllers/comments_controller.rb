class CommentsController < BaseController
  before_action :set_article

  def create
    @comment = current_user.comments.create(comment_params.merge(article: @article))
    authorize! :create, @comment
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to article_path(@article), notice: t('comment.destroy.notice')
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :article_id)
  end
end

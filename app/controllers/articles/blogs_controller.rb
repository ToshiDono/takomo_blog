module Articles
  class BlogsController < ApplicationController
    def show
      @articles = Article.where(user_id: current_user.id)
    end
  end
end

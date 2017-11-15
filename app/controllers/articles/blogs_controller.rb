module Articles
  class BlogsController < ApplicationController
    def show
      @articles = current_user.articles
    end
  end
end

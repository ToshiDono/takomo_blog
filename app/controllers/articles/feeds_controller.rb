module Articles
  class FeedsController < ApplicationController
    def index
      @articles = Article.all
      # render 'articles/articles/index'
    end
  end
end

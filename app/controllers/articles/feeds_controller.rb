module Articles
  class FeedsController < ApplicationController
    def index
      @articles = Article.all
    end
  end
end

class ArticlesController < ApplicationController

    def show
        # debugger  # pauses webserver to go into debug mode
        @article = Article.find(params[:id])
    end

end
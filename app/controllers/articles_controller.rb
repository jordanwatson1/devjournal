class ArticlesController < ApplicationController

    def show
        # debugger  # pauses webserver to go into debug mode
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        # redirect_to article_path(@article) # redirect to that article page
        redirect_to @article
    end

end
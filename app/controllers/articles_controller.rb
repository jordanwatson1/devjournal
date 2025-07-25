class ArticlesController < ApplicationController

    def show
        # debugger  # pauses webserver to go into debug mode
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))  # White list title and description
        if @article.save
            flash[:notice] = "Article was created successfully."
            # redirect_to article_path(@article) # redirect to that article page
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

end
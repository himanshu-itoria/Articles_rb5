class ArticlesController < ApplicationController

    def show
    @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article1 = Article.new
    end

    def create
        @article1 = Article.new(params.require(:article).permit(:title,:description))
        @article1.save
        # redirect_back(fallback_location: @article)
        # redirect_to action:show,id:
        redirect_to @article1
    end


end
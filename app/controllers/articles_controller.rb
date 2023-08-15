class ArticlesController < ApplicationController

  before_action :id_article, only: [:show,:edit,:update,:destroy]

    def show
    
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def edit
        
    end

    
    def create
        @article = Article.new(pars)
    if  @article.save
        flash[:notice] = "Article was created successfully"
         redirect_to @article
        # redirect_back(fallback_location: @article)
        # redirect_to action:show,id:
        # redirect_to @article
    else
        render 'new'

    end

end

def update
    
    if @article.update(pars)
        flash[:notice] = "Article was updated successfully"
     redirect_to @article

    else

      render 'edit'
    end
end

def destroy
    
    @article.destroy
    redirect_to articles_path
end

private 
def id_article
    @article = Article.find(params[:id])
  
end

def pars
    params.require(:article).permit(:title,:description)
   
end



end
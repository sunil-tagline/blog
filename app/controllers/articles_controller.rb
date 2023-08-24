class ArticlesController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destory]
  
  before_action :authenticate_person!, only: %i[ edit new]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create 
    @article = Article.new(article_params)
    @article.person_id = current_person.id
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update 

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other 
  end

  private
    def set_user
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end

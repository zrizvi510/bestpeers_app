class Api::V1::ArticlesController < Api::V1::ApiController
  before_action :current_user
  respond_to :json
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # render json: @article
  end


  def create
    @article = Article.new(article_params)
    if @article.save
    else
      render json: {error: 'Unable to create Article'}, status: 400 
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
    else
      render json: @article.errors, status: 400
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
    else
      render error: {error: 'Unable to delete Article'}, status: 400
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :like)
    end

  def current_user
     user = User.find_by(authentication_token: request.headers['token'])
    if user && request.headers['token'] != nil
      return user
    end
     render json: :unauthorized,status: 403
  end
end
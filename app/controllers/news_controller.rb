class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD'], except: ['index', 'show', 'feed']

  # GET /news
  # GET /news.json
  def index
    @news = News.all.order(created_at: :desc)
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to edit_news_path(@news), notice: 'Новость создана.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to edit_news_path(@news), notice: 'Новость обновлена.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to redirect_url, notice: 'Новость была удалена.' }
    end
  end

  def feed
  	@news = News.all
  	respond_to do |format|
  		format.rss { render :layout => false }
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :content, :published)
    end

    def redirect_url
      panel = params.permit(:panel)[:panel]
      if panel == 'list'
        "#{list_control_url}?content_type=news"
      else
        root_control_url
      end
    end
end

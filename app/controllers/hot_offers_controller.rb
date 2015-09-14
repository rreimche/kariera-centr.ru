class HotOffersController < ApplicationController
  before_action :set_hot_offer, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD'], except: ['index', 'show']

  # GET /hot_offers
  # GET /hot_offers.json
  def index
    @hot_offers = HotOffer.all.order(created_at: :desc)
  end

  # GET /hot_offers/1
  # GET /hot_offers/1.json
  def show
  end

  # GET /hot_offers/new
  def new
    @hot_offer = HotOffer.new
  end

  # GET /hot_offers/1/edit
  def edit
  end

  # POST /hot_offers
  # POST /hot_offers.json
  def create
    @hot_offer = HotOffer.new(hot_offer_params)

    respond_to do |format|
      if @hot_offer.save
        format.html { redirect_to edit_hot_offer_path(@hot_offer), notice: 'Акция создана.' } 
      else
        format.html { render :new } 
      end
    end
  end

  # PATCH/PUT /hot_offers/1
  # PATCH/PUT /hot_offers/1.json
  def update
    respond_to do |format|
      if @hot_offer.update(hot_offer_params)
        format.html { redirect_to edit_hot_offer_path(@hot_offer), notice: 'Акция обновлена.' } 
      else
        format.html { render :edit } 
      end
    end
  end

  # DELETE /hot_offers/1
  # DELETE /hot_offers/1.json
  def destroy
    @hot_offer.destroy
    respond_to do |format|
      format.html { redirect_to redirect_url, notice: 'Акция удалена.' } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hot_offer
      @hot_offer = HotOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hot_offer_params
      params.require(:hot_offer).permit(:content, :start_date, :end_date)
    end

    def redirect_url
      panel = params.permit(:panel)[:panel]
      if panel == 'list'
        "#{list_control_url}?content_type=hot_offers"
      else
        root_control_url
      end
    end
end

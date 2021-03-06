class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD'], except: ['new', 'create', 'show', 'index']


  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.where(published: true).reverse
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    @courses = Course.all.order(title: :asc)
  end

  # GET /feedbacks/1/edit
  def edit
    @courses = Course.all
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create 
    @feedback = Feedback.new(feedback_params)
    @courses = Course.all
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: '' }
      else
        format.html { render :new } 
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update 
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to edit_feedback_path(@feedback), notice: 'Отзыв отредактирован.' }
      else
        format.html { render :edit } 
      end
    end
  end

  def publish
    respond_to do |format|
      if @feedback.update(published: true)
        format.html { redirect_to redirect_url, notice: 'Отзыв опубликован.' }
      else
        format.html { render :edit } 
      end
    end
  end

  def unpublish
    respond_to do |format|
      if @feedback.update(published: false)
        format.html { redirect_to redirect_url, notice: 'Отзыв снят с публикации.' }
      else
        format.html { render :edit } 
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to root_control_url, notice: 'Отзыв удалён.' } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # preprocessing parameters
    def feedback_params
      # workaround for :is_for_hr_services
      if params[:feedback][:course_id] == 'hr'
        params[:feedback][:is_for_hr_services] = true 
        params[:feedback][:course] = ''
      else
        params[:feedback][:is_for_hr_services] = false
      end
      # Never trust parameters from the scary internet, only allow the white list through.
      params.require(:feedback).permit(:name, :content, :course_id, :is_for_hr_services)
    end

    def redirect_url
      panel = params.permit(:panel)[:panel]
      if panel == 'list'
        "#{list_control_url}?content_type=feedbacks"
      else
        root_control_url
      end
    end
end

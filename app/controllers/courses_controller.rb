class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD'], except: ['index', 'search', 'show']

  # GET
  # def index
  #   @courses = Course.all
  # end

  # GET /courses
  def search
    parameters = params.permit(:titlepart)
    @searched = parameters[:titlepart]

    unless @searched.nil?
      #TODO is this here really working right?
      @courses = Course.order(start_date: :desc).where(published: true).where("title LIKE ?", "%#{@searched}%")
    else
      @courses = Course.where(published: true).order(start_date: :desc)
    end

  end

  # GET /courses/1
  def show

    if @course.published == false or @course.published == nil
      throw ActiveRecord::RecordNotFound
    end

    @qtyPanels = 0
    (0...ENV['COURSE_PANELS_QTY'].to_i).each do |i|
      @qtyPanels = @qtyPanels + 1 if ( @course["panel#{i}_title"] != "" and @course["panel#{i}_title"] != nil )
    end
    
    @qtyCurriculum = 0
    (0...ENV['COURSE_CURRICULUMPARTS_QTY'].to_i).each do |i|
      @qtyCurriculum = @qtyCurriculum + 1 if ( @course["curriculum#{i}_title"] != "" and @course["curriculum#{i}_title"] != nil )
    end
    

    if Feedback.where(course: @course, published: true).count < 3
      feedbacks = Feedback.where(published: true).limit(5).order(created_at: :desc)
      feedbacks_are_own = false
    else
      feedbacks = Feedback.where(course: @course, published: true).order(created_at: :desc)
      feedbacks_are_own = true
    end

    if feedbacks.size != 0
      feedbacks = render_to_string partial: 'feedbacks', locals: {feedbacks: feedbacks, feedbacks_are_own: feedbacks_are_own}
      curriculum = render_to_string partial: 'curriculum'
      
      @course.full_descr.sub! '[отзывы]', feedbacks
      @course.full_descr.sub! '[программа]', curriculum
      
      (0...ENV['COURSE_PANELS_QTY'].to_i).each do |i|
        if @course["panel#{i}_content".to_sym] != nil then
          @course["panel#{i}_content".to_sym].sub! '[отзывы]', feedbacks
          @course["panel#{i}_content".to_sym].sub! '[программа]', curriculum
        end
      end
      (0...ENV['COURSE_CURRICULUMPARTS_QTY'].to_i).each do |i|
        if @course["curriculum#{i}_content".to_sym] != nil then
          @course["curriculum#{i}_content".to_sym].sub! '[отзывы]', feedbacks
        end
      end
    end

    # begin 
    #   (0...ENV['COURSE_PANELS_QTY'].to_i).each do |i|
    #     if  @course["panel#{i}_content".to_sym] != nil then
    #       @course["panel#{i}_content".to_sym] = Shortcode.process(@course["panel#{i}_content".to_sym])
    #     end
    #   end
    #   # (0...ENV['COURSE_CURRICULUMPARTS_QTY'].to_i).each do |i|
    #   #   if  @course["curriculum#{i}_content".to_sym] != nil then
    #   #     @course["curriculum#{i}_content".to_sym] = Shortcode.process(@course["curriculum#{i}_content".to_sym])
    #   #   end
    #   # end
    #   @course.full_descr = Shortcode.process(@course.full_descr)
      
    #   rescue
    #   @course.full_descr = '<h1 class="text-danger bg-danger">КОДЫ ПОДСТАНОВКИ НЕ ОБРАБОТАНЫ: ОШИБКА!!!</h1>' + @course.full_descr
    # end
  end

  # GET /courses/new
  def new
    @course = Course.new
    @timegroups = Course.timegroups
  end

  # GET /courses/1/edit
  def edit
    @timegroups = Course.timegroups
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    @timegroups = Course.timegroups

    respond_to do |format|
      if @course.save
        format.html { redirect_to edit_course_path(@course), notice: 'Курс создан.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  def update
    @timegroups = Course.timegroups
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to edit_course_path(@course), notice: 'Курс успешно обновлён.' }
      else
        format.html { render :edit }
      end
    end
  end

  def publish
    @timegroups = Course.timegroups
    respond_to do |format|
      if @course.update(published: true)
        format.html { redirect_to redirect_url, notice: 'Курс опубликован.' }
      else
        errors = 'Ошибки при публикации курса:'
        @course.errors.full_messages.each do |message|
          errors += '- ' + message + '<br>'
        end
        format.html { redirect_to redirect_url, notice: errors } 
      end
    end
  end

  def unpublish
    @timegroups = Course.timegroups
    respond_to do |format|
      if @course.update(published: false)
        format.html { redirect_to redirect_url, notice: 'Курс снят с публикации.' }
      else
        errors = 'Ошибки при снятии курса с публикации:'
        @course.errors.full_messages.each do |message|
          errors += '- ' + message + '<br>'
        end
        format.html { redirect_to redirect_url, notice: errors } 
      end
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to redirect_url, notice: 'Курсы был удалён.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      if action_name == search
        params.permit('titlepart')
      else
        to_permit = [:title, 
          :featured_image, :short_descr, :full_descr, 
          :start_date, :duration, :full_price, 
          :advance_payment, :monthly_payment, 
          :timegroup, :published]

          (0...ENV['COURSE_PANELS_QTY'].to_i).each do |i|
            to_permit.push "panel#{i}_title".to_sym
            to_permit.push "panel#{i}_content".to_sym
          end

          (0...ENV['COURSE_CURRICULUMPARTS_QTY'].to_i).each do |i|
              to_permit.push "curriculum#{i}_title".to_sym
              to_permit.push "curriculum#{i}_content".to_sym
          end

        params.require(:course).permit(to_permit)
      end
    end

    def redirect_url
      panel = params.permit(:panel)[:panel]
      if panel == 'list'
        "#{list_control_url}?content_type=courses"
      else
        root_control_url
      end
    end
end

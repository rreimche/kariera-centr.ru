class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD'], except: ['index', 'search', 'show']

  # GET /courseslist
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /ourcourses
  def search
    parameters = params.permit(:titlepart)
    @searched = parameters[:titlepart]

    unless @searched.nil?
      @courses = Course.order(start_date: :desc).where("title LIKE ?", "%#{@searched}%" )
    else
      @courses = Course.all.order(start_date: :desc)
    end

  end

  # GET /courses/1
  # GET /courses/1.json
  def show
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
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @timegroups = Course.timegroups

    respond_to do |format|
      if @course.save
        format.html { redirect_to redirect_url, notice: 'Курс создан.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @timegroups = Course.timegroups
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to redirect_url, notice: 'Курс успешно обновлён.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
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
        params.require(:course).permit(:title, :featured_image, :short_descr, :full_descr, :start_date, :duration, :full_price, :timegroup)
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

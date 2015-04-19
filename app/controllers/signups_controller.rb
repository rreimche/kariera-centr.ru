class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :edit, :update, :destroy]
=begin
  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
  end
=end

  # GET /signups/new
  def new
    @signup = Signup.new
    @course = Course.find( params.permit(:course)[:course] )
    respond_to do |format|
      format.js
    end
  end

=begin
  # GET /signups/1/edit
  def edit
  end
=end

  # POST /signups
  # POST /signups.json
  def create
    @signup = Signup.new(signup_params)

    @course = Course.find(signup_params[:course])

    status = MailUtility.try_delivering_email do
          SignupMailer.new_signup(@course.title, signup_params[:name], signup_params[:email]).deliver
    end

    unless status
          flash.now[:error] = "К сожалению, что-то пошло не так, попробуйте отправить заявку ещё раз или позвоните нам."
    end


    respond_to do |format|
      if @signup.save and status
        format.js {}
      else
        format.js { render :new }
      end
    end
  end
=begin
  # PATCH/PUT /signups/1
  # PATCH/PUT /signups/1.json
  def update
    respond_to do |format|
      if @signup.update(signup_params)
        format.html { redirect_to @signup, notice: 'Signup was successfully updated.' }
        format.json { render :show, status: :ok, location: @signup }
      else
        format.html { render :edit }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup.destroy
    respond_to do |format|
      format.html { redirect_to signups_url, notice: 'Signup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_params
      params.require(:signup).permit(:course, :name, :email)
    end
end

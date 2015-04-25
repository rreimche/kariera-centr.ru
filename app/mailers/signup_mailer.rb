class SignupMailer < ActionMailer::Base

  def new_signup(course, name, phone, email)
  	@course = course
  	@name = name
    @phone = phone
  	@email = email
  	mail to: ENV['EMAIL_GENERAL'], subject: 'Новая заявка с kariera-centr.ru'
  end

  private

  def signup_mailer_params
  	params.permit(:course, :name, :phone, :email)
  end
end

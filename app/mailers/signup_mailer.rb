class SignupMailer < ActionMailer::Base
  default from: "donotreply@kariera-centr.ru"

  def new_signup(course, name, email)
  	@course = course
  	@name = name
  	@email = email
  	mail to: ENV['EMAIL_GENERAL'], subject: 'Новая заявка с kariera-centr.ru'
  end

  private

  def signup_mailer_params
  	params.permit(:course, :name, :email)
  end
end

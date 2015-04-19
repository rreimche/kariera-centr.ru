module MailUtility
    # Logs and emails exception
    # Optional args:
    # request: request Used for the ExceptionNotifier
    # info: "A descriptive messsage"
    def self.log_exception(e, args = {})
      extra_info = args[:info]

      Rails.logger.error extra_info if extra_info
      Rails.logger.error e.message
      st = e.backtrace.join("\n")
      Rails.logger.error st

      extra_info ||= "<NO DETAILS>"
      request = args[:request]
      env = request ? request.env : {}
      ExceptionNotifier::Notifier.exception_notification(env, e, :data => {:message => "Exception: #{extra_info}"}).deliver
    end

    def self.try_delivering_email(options = {}, &block)
      begin
        yield
        return true
      rescue  EOFError,
              IOError,
              TimeoutError,
              Errno::ECONNRESET,
              Errno::ECONNABORTED,
              Errno::EPIPE,
              Errno::ETIMEDOUT,
              Net::SMTPAuthenticationError,
              Net::SMTPServerBusy,
              Net::SMTPSyntaxError,
              Net::SMTPUnknownError,
              OpenSSL::SSL::SSLError => e
        log_exception(e, options)
        return false
      end
    end
end
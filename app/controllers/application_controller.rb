class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_locale
	before_action :set_mailer_host
  # before_action :before_action_proc
  # after_action :after_action_proc

  def default_url_options(options={}) 
    { :locale => I18n.locale }
  end
  
  private

    # def before_action_proc
    #   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
    # end
    #
    # def after_action_proc
    #   ActiveRecord::Base.remove_connection(ActiveRecord::Base)
    # end
	
    def set_locale
      I18n.locale = (params[:locale] if params[:locale].present?) || cookies[:locale] || I18n.default_locale || 'en'
      cookies[:locale] = I18n.locale if cookies[:locale] != I18n.locale
      Rails.logger.info I18n.locale
    end

	  def set_mailer_host
	    ActionMailer::Base.default_url_options[:host] = request.host_with_port
	  end
    
end

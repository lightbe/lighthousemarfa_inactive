class PagesController < ApplicationController
  
  def contact
    @page_title_view = "#{t :page_title_contact}"
    set_meta_tags title: "#{@page_title_view}"
    
    regex_email = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/   
    regex_url   = /^(http|ftp|https)|[.][a-zA-Z][a-zA-Z]/
		
    if params[:commit] == "#{t :contact_submit}"      
      case
      when params[:name] =~ regex_email     || params[:name]     =~ regex_url
        flash.now[:danger] = "#{t :regex_error_name}"
        render :contact
      when params[:org] =~ regex_email      || params[:org]      =~ regex_url
        flash.now[:danger] = "#{t :regex_error_org}"
        render :contact
      when params[:location] =~ regex_email || params[:location] =~ regex_url
        flash.now[:danger] = "#{t :regex_error_location}"
        render :contact
      when params[:phone] =~ regex_email    || params[:phone]    =~ regex_url
        flash.now[:danger] = "#{t :regex_error_phone}"
        render :contact
      when params[:ordernum] =~ regex_email || params[:ordernum] =~ regex_url
        flash.now[:danger] = "#{t :regex_error_ordernum}"
        render :contact
      when params[:message] =~ regex_email  || params[:message]  =~ regex_url
        flash.now[:danger] = "#{t :regex_error_msg}"
        render :contact
      when verify_recaptcha
	    
  	    if params[:purpose].blank?
  				@purpose  = "1"
  			else
  				@purpose  = params[:purpose]
  			end	
        @contact_form             = Hash.new
        @contact_form["name"]     = params[:name]
        @contact_form["phone"]    = params[:phone]	    
  	    if params[:email].present?
      	  @contact_form["email"] = params[:email]
  			else
          @contact_form["email"] = "noemail@provided.com"
  			end		
        @contact_form["ordernum"] = params[:ordernum]
        @contact_form["org"]      = params[:org]
        @contact_form["location"] = params[:location]
        @contact_form["message"]  = params[:message]	    

        case @purpose
        when '2'
          begin
            case
  			    when I18n.locale.to_s == "es" && @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "una #{t :contact_question}. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_es(@contact_form).deliver
  			    when I18n.locale.to_s == "es"
            	LighthouseMailer.question_email_es(@contact_form).deliver
  			    when @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "a #{t :contact_question}. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_en(@contact_form).deliver
  					else
            	LighthouseMailer.question_email_en(@contact_form).deliver
  					end
            flash[:success] = "#{t :contact_flash_question} #{t :contact_flash_emailed} #{t :contact_flash_confirm_email}"
          rescue Net::SMTPFatalError, Net::SMTPSyntaxError, Net::SMTPAuthenticationError, Errno::ECONNRESET => error_msg
            logger.warn error_msg
            flash[:info] = "#{t :contact_notice1} #{t :contact_notice2} - #{error_msg}"
          end
        when '3'
          begin
            case
  			    when I18n.locale.to_s == "es" && @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "un #{t :contact_refund}. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_es(@contact_form).deliver
  			    when I18n.locale.to_s == "es"
            	LighthouseMailer.refund_email_es(@contact_form).deliver
  			    when @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "a #{t :contact_refund}. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_en(@contact_form).deliver
  					else
            	LighthouseMailer.refund_email_en(@contact_form).deliver
  					end
            flash[:success] = "#{t :contact_flash_refund} #{t :contact_flash_emailed} #{t :contact_flash_confirm_email}"
          rescue Net::SMTPFatalError, Net::SMTPSyntaxError, Net::SMTPAuthenticationError, Errno::ECONNRESET => error_msg
            logger.warn error_msg
            flash[:info] = "#{t :contact_notice1} #{t :contact_notice2} - #{error_msg}"
          end
        when '4'
          begin
            case
  			    when I18n.locale.to_s == "es" && @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "un #{t :contact_bug} en el sitio web. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_es(@contact_form).deliver
  			    when I18n.locale.to_s == "es"
            	LighthouseMailer.bug_email_es(@contact_form).deliver
  			    when @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "a #{t :contact_bug} found on the website. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_en(@contact_form).deliver
  					else
            	LighthouseMailer.bug_email_en(@contact_form).deliver
  					end
            flash[:success] = "#{t :contact_flash_bug} #{t :contact_flash_emailed} #{t :contact_flash_confirm_email}"
          rescue Net::SMTPFatalError, Net::SMTPSyntaxError, Net::SMTPAuthenticationError, Errno::ECONNRESET => error_msg
            logger.warn error_msg
            flash[:info] = "#{t :contact_notice1} #{t :contact_notice2} - #{error_msg}"
          end
        else # '1' - sending feedback
          begin
            case
  			    when I18n.locale.to_s == "es" && @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "algunos comentarios. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_es(@contact_form).deliver
  			    when I18n.locale.to_s == "es"
  						LighthouseMailer.feedback_email_es(@contact_form).deliver
  			    when @contact_form["email"] == "noemail@provided.com"
              @contact_form["email_type"]  = "some feedback. #{t :contact_no_email_provided}"
  						LighthouseMailer.no_email_en(@contact_form).deliver
  					else
  						LighthouseMailer.feedback_email_en(@contact_form).deliver
  					end
            flash[:success] = "#{t :contact_flash_feedback} #{t :contact_flash_emailed} #{t :contact_flash_confirm_email}"
          rescue Net::SMTPFatalError, Net::SMTPSyntaxError, Net::SMTPAuthenticationError, Errno::ECONNRESET => error_msg
            logger.warn error_msg
            flash[:info] = "#{t :contact_notice1} #{t :contact_notice2} - #{error_msg}"
          end
        end
       
        redirect_to locale_root_path
      else
        flash.delete(:recaptcha_error)
        flash.now[:danger] = "#{t :contact_msg1}"
        render :contact
      end
      
    end
  end

  def home
    @page_title_view = "#{t :page_title_home}"
    set_meta_tags site: "#{t :meta_site_home}", title: "#{t :meta_title_home}", description: "#{t :meta_desc_home}", keywords: "#{t :meta_keywords_home}"
  end

  def marfa
    @page_title_view     = "#{t :page_title_marfa}"
    set_meta_tags title: "#{@page_title_view}"
  end

  def overview
    @page_title_view = "#{t :page_title_overview}"
    set_meta_tags site: "#{t :meta_site_overview}", title: "#{t :meta_title_overview}", description: "#{t :meta_desc_overview}", keywords: "#{t :meta_keywords_overview}"
  end

  def terms
    @page_title_view = "#{t :page_title_terms}"
    set_meta_tags title: "#{@page_title_view}"
  end

  def testpage
    @page_title_view = "#{t :page_title_testpage}"
    set_meta_tags title: "#{@page_title_view}"
  end

  def thanks
    @page_title_view = "#{t :page_title_thanks}"
    set_meta_tags title: "#{@page_title_view}"
  end
  
end

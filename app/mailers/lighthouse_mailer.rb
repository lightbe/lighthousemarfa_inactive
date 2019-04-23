# encoding: utf-8
class LighthouseMailer < ApplicationMailer
 
  def bug_email_en(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: " #{@contact_form["name"]}, Thanks for Informing us about the Defect/Bug!!")
  end
 
  def bug_email_es(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, Gracias por informarnos sobre el defecto / error!!")
  end
 
  def feedback_email_en(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, Thanks for your Feedback!!")
  end
 
  def feedback_email_es(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, Gracias por tus comentarios!!")
  end
 
  def no_email_en(contact_form)
    @contact_form = contact_form
    mail(to: "thelighthouseunlimited@gmail.com", subject: " #{@contact_form["name"]}, is sending you #{@contact_form["email_type"]}!!")
  end
 
  def no_email_es(contact_form)
    @contact_form = contact_form
    mail(to: "thelighthouseunlimited@gmail.com", subject: " #{@contact_form["name"]}, le envía #{@contact_form["email_type"]}!!")
  end
 
  def question_email_en(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, Thanks for your Question!!")
  end
 
  def question_email_es(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, Gracias por tu pregunta!!")
  end
 
  def refund_email_en(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, We have received your Refund Request!!")
  end
 
  def refund_email_es(contact_form)
    @contact_form = contact_form
    email_with_name = "#{@contact_form["name"]} <#{@contact_form["email"]}>"
    mail(to: email_with_name, bcc: "thelighthouseunlimited@gmail.com", subject: "#{@contact_form["name"]}, Hemos recibido su solicitud de reembolso!!")
  end
  
end

module ApplicationHelper
	
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "LightHouse Unlimited"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def check_radio_button (purpose)
    
    if params[:purpose].blank?
      radio_button_tag(:purpose, purpose)
    elsif purpose == params[:purpose]
      radio_button_tag(:purpose, purpose, :checked => true)
    else
      radio_button_tag(:purpose, purpose)
    end
    
  end
  
end

class ErrorsController < ApplicationController
  
  def bad_request
    @page_title_view     = "#{t(:error400_title)}"
    set_meta_tags title: "#{@page_title_view}"
    render(status: 400)
  end
  
  def internal_server_error
    @page_title_view     = "#{t(:error500_title)}"
    set_meta_tags title: "#{@page_title_view}"
    render(status: 500)
  end

  def not_found
    @page_title_view     = "#{t(:error404_title)}"
    set_meta_tags title: "#{@page_title_view}"
    render(status: 404)
  end

  def unprocessable_entity
    @page_title_view     = "#{t(:error422_title)}"
    set_meta_tags title: "#{@page_title_view}"
    render(status: 422)
  end
  
end
Rails.application.routes.draw do
  
  localized do       
    get "/"                => "pages#home", :as => :locale_root
    get "contact"          => "pages#contact"
	  get "marfa"            => "pages#marfa"
    get "overview"         => "pages#overview"
    get "store"            => "pages#store"
    get "testpage"         => "pages#testpage"
    get "terms"            => "pages#terms"
    get "thanks"           => "pages#thanks"
    post "thanks"          => "pages#thanks"
    
    match "/400"           => "errors#bad_request", :via => :all
    match "/404"           => "errors#not_found", :via => :all
    match "/422"           => "errors#unprocessable_entity", :via => :all
    match "/500"           => "errors#internal_server_error", :via => :all
  end
  
  root                        "pages#home"
  
end

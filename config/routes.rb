Rails.application.routes.draw do
  get '/' => 'client/home#main', as: :client_home
  get '/room/index' => 'client/room#index', as: :room_index
  get '/room/view' => 'client/room#view', as: :room_view
  get '/reservation' => 'client/home#reserve', as: :client_reserve
  get '/tour' => 'client/home#tour', as: :client_tour
  get '/notice' => 'client/home#notice', as: :client_notice
  get '/faq' => 'client/home#faq', as: :client_faq

  post "/ajax/tmp_upload" => 'ajax/home#tmp_upload', as: :ajax_tmp_upload
  namespace :admin do
    get "" => 'home#index', as: :home
    get "login" => "home#login", as: :login
    get "logout" => "home#logout", as: :logout
    post "login" => "home#login_request", as: :login_request
    get "main_image/index" => "main_image#index", as: :main_image_index
    get "main_image/new" => "main_image#new", as: :main_image_new
    post "main_image/create" => "main_image#create", as: :main_image_create
    get 'main_image/:id/edit' => "main_image#edit", as: :main_image_edit
    put "main_image/:id/update" => "main_image#update", as: :main_image_update
    get "main_image/:id/destroy" => "main_image#destroy", as: :main_image_destroy
    put "main_image/order" => "main_image#order", as: :main_image_order

    get "main_etc/index" => "main_image#etc_index", as: :main_image_etc_index
    put "main_etc/update" => "main_image#etc_update", as: :main_image_etc_update

    get "top_bg/index" => "home#top_bg_index", as: :top_bg_index
    put "top_bg/update" => "home#top_bg_update", as: :top_bg_update

    #get "reserve" => "home#reserve", as: :reserve_edit
    #put "reserve/update" => "home#reserve_update", as: :reserve_update

    get "tour/index" => "tour#index", as: :tour_index
    get "tour/new" => "tour#new", as: :tour_new
    post "tour/create" => "tour#create", as: :tour_create
    get "tour/:id/edit" => "tour#edit", as: :tour_edit
    put "tour/:id/update" => "tour#update", as: :tour_update
    get "tour/:id/destroy" => "tour#destroy", as: :tour_destroy
    put "tour/order_update" => "tour#order_update", as: :tour_order_update

    get "notice/index" => "notice#index", as: :notice_index
    get "notice/new" => "notice#new", as: :notice_new
    post "notice/create" => "notice#create", as: :notice_create
    get "notice/:id/edit" => "notice#edit", as: :notice_edit
    put "notice/:id/update" => "notice#update", as: :notice_update
    get "notice/:id/destroy" => "notice#destroy", as: :notice_destroy

    get "faq/index" => "faq#index", as: :faq_index
    get "faq/new" => "faq#new", as: :faq_new
    post "faq/create" => "faq#create", as: :faq_create
    get "faq/:id/edit" => "faq#edit", as: :faq_edit
    put "faq/:id/update" => "faq#update", as: :faq_update
    get "faq/:id/destroy" => "faq#destroy", as: :faq_destroy
    put "faq/order_update" => "faq#order_update", as: :faq_order_update
  end

end

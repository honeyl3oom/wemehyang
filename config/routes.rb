Rails.application.routes.draw do
  get '/' => 'client/home#main', as: :client_home
  get '/room/index' => 'client/room#index', as: :room_index
  get '/room/view' => 'client/room#view', as: :room_view
  get '/special' => 'client/home#special', as: :client_special
  get '/tour' => 'client/home#tour', as: :client_tour
  get '/notice' => 'client/home#notice', as: :client_notice
  get '/faq' => 'client/home#faq', as: :client_faq


  namespace :admin do
    get "" => 'home#index', as: :home
  end
end

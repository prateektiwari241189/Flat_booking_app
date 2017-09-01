Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "flat_booking_controller#index", :via => [:get, :post]
  post 'flat_booking_controller/create'
  get 'flat_booking_controller/list'
  get 'flat_booking_controller/generate_monthly_report'
  get 'flat_booking_controller/generate_yearly_report'
  post 'flat_booking_controller/generate_report_yearly'
  post 'flat_booking_controller/generate_report_monthly'
  get    '/flat_booking/:id',   to: 'flat_booking_controller#show'
  resources :flat_booking
end

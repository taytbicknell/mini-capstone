Rails.application.routes.draw do
  
  namespace :api do
    get "/all_products_url" => "products#all_products_method"
    
    get "/first_product_url" => "products#first_product_method"
    
    get "/second_product_url" => "products#second_product_method"
     
    get "/last_product_url" => "products#last_product_method"
    get "/query_params_url" => "query_products#query_params_method"

    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end


Tinyurl::Application.routes.draw do
get '/:id(/:desc)' => 'urls#show', :as => ''
get '/' => 'urls#new', :as => 'new_url'
post '/' => 'urls#create', :as => 'urls'
end

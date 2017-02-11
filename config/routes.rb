Rails.application.routes.draw do
  apipie
  scope :api, constraints: { format: 'json' }  do
    get '/ping/hello', to: 'ping#hello' # Hello world ping
  end
end

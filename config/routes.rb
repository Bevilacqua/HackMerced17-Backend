Rails.application.routes.draw do
  apipie
  scope :api, constraints: { format: 'json' }  do
    get '/ping/hello', to: 'ping#hello' # Hello world ping
    get '/analyze/authors', to: 'analyze#authors' # Analyze one or more authors
  end
end

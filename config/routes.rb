Rails.application.routes.draw do
  apipie
  scope :api, constraints: { format: 'json' }  do
    get '/ping/hello', to: 'ping#hello' # Hello world ping
#    get '/analyze/authors', to: 'analyze#authors' # Analyze one or more authors
    get '/analyze/determine_most_common', to: "analyze#determine_most_common"
  end
end

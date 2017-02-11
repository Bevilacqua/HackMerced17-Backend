class PingController < ApplicationController
  resource_description do
    short 'A basic resource for testing the webserver.'
  end
  # hello
  # =====
  # Return a hello world JSON response to ensure the routes and hosting works
  #
  # GET api/ping/hello
  api :GET, '/ping/hello', "Return a hello world message and a 200 status."
  formats ['json']
  def hello
    render json: {msg: "Hello world!", status: 200}, status: 200
  end

end

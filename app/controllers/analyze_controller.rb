class AnalyzeController < ApplicationController
  # authors
  # =======
  #   Analyze one or more authors.
  #
  # GET api/analyze/authors
  api :GET, '/analyze/authors', "Analyze one or more authors and return a mean article count (MAC) as well as individual author analysis"
  param :authors, Array, :desc => "List of authors", :required => true do
    param :first_name, String, :desc => "First name of author.", :required => false
    param :last_name, String, :desc => "Last name of author.", :required => true
    param :institution, String, :desc => "Institution author belongs to", :required => false
  end
  formats ['json']
  def authors
    list_of_authors = params[:authors]
    # Ensure the request provided an array of authors to analyze
    if !list_of_authors
      render json: [error: "No author array presented.", status: 400], status: 400
      return
    end

    list_of_authors.each do |author|
      # Ensure the request provided a last name for the author
      if author[:last_name] == nil
        render json: [error: "Every Author must have a last name", status: 400], status: 400
        return
      end
    end
    # TODO: horrible response lol.
    render json: [msg: "ayyy", status: 200], status: 200
  end

end

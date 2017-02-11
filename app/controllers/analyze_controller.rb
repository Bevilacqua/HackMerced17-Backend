class AnalyzeController < ApplicationController
  # # authors
  # # =======
  # #   Analyze one or more authors.
  # #
  # # GET api/analyze/authors
  # api :GET, '/analyze/authors', "Analyze one or more authors and return a mean article count (MAC) as well as individual author analysis"
  # param :authors, Array, :desc => "List of authors", :required => true do
  #   param :first_name, String, :desc => "First name of author.", :required => false
  #   param :last_name, String, :desc => "Last name of author.", :required => true
  #   param :institution, String, :desc => "Institution author belongs to", :required => false
  # end
  # formats ['json']
  # def authors
  #   list_of_authors = params[:authors]
  #   # Ensure the request provided an array of authors to analyze
  #   if !list_of_authors
  #     render json: [error: "No author array presented.", status: 400], status: 400
  #     return
  #   end
  #
  #   list_of_authors.each do |author|
  #     # Ensure the request provided a last name for the author
  #     if author[:last_name] == nil
  #       render json: [error: "Every Author must have a last name", status: 400], status: 400
  #       return
  #     end
  #
  #     puts "http://api.elsevier.com/content/search/author/?apiKey=#{ENV['SCOPUS_KEY']}"
  #     # THE FOLLOWING SHOULD GO IN A JOB
  #     RestClient.get("http://api.elsevier.com/content/search/author/?apiKey=#{ENV['SCOPUS_KEY']}", params:{} , headers:{"X-ELS-APIKey": ENV['SCOPUS_KEY']})
  #     # --------------------------------
  #   end
  #
  #   # TODO: horrible response lol.
  #   render json: [msg: "ayyy", status: 200], status: 200
  # end



  # determine_most_common
  # =====================
  #   Determine the five most common REAL & SUBSTANTIAL words out of a list
  #
  # GET /api/analyze/determine_most_common
  api :GET, '/analyze/determine_most_common', "Determine what words in a list are the most commone real and substantial words. All words must be real and contain substance."
  param :words, Array, :desc => "List of words to analyze", :required => true do
    param :word, String, :desc => "The word to analyze", :required => true
    param :count, String, :desc => "The times the word ocours", :required => true
  end
  def determine_most_common
    list_of_words = params[:words]
    if !list_of_words
      render json: [msg: "Word list missing.", status: 400], status: 400
      return
    end

    most_common = {}

    list_of_words.each do |word_obj|
      if(!word_obj[:word] || !word_obj[:count])
        render json: [msg: "Each word object must have a word and a count.", status: 400], status: 400
        return
      end
      most_common[word_obj[:word]] = word_obj[:count] if word_obj[:word].length > 3
      break if most_common.count >= 5
    end

    render json: [most_common: most_common, status: 200], status: 200
  end

end

module Tmdb
  class Client
    BASE_URL = 'https://api.themoviedb.org/3'
    def initialize
      @client = Faraday.new(url: BASE_URL) do |f|
        f.headers['Authorization'] = "Bearer #{ENV['TMDB_ACCESS_TOKEN']}"
        f.headers['Content-Type'] = 'application/json'
        f.headers['Accept'] = 'application/json'

        f.request :json
        f.response :json
        f.response :raise_error
      end
    end
    def popular_movies(page: 1)
      response = @client.get(BASE_URL + '/movie/popular',{page: page, language: 'pt-BR'})
      response.body
    end

    def genres
      response = @client.get(BASE_URL + "/genre/movie/list", { language: "pt-BR" })
      response.body["genres"]
    end
  end
end
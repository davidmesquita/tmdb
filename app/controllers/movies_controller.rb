class MoviesController < ApplicationController
  def index
    client = Tmdb::Client.new
    data = client.popular_movies(page: 1)

    @movies = data['results']
    @total_pages = data['total_pages']
  end
end
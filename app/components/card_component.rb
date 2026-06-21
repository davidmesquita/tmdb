class CardComponent < ViewComponent::Base

    def initialize(movie:)
        @movie = movie
    end

    private

    attr_reader :movie

    def poster_url
        "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
    end

    def genre_names
        Array(movie["genre_ids"]).filter_map { |id| Tmdb::Genres.name_for(id) }
    end
    
end
module Tmdb
  class Genres
    class << self
      def lookup
        @lookup ||= Client.new.genres.index_by { |genre| genre["id"] }
      end

      def name_for(id)
        lookup.dig(id, "name")
      end
    end
  end
end

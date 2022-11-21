module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        array
          .select { |film| valid_rating?(film) }
          .select { |film| enough_countries?(film) }
          .reduce({ rating: 0, amount: 0 }) { |info, film| aggregate_film_rating(film, info) }
          .then { |info| info[:rating] / info[:amount] }
      end

      def chars_count(_films, _threshold)
        0
      end

      def valid_rating?(film)
        !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive?
      end

      def enough_countries?(film)
        !film['country'].nil? && film['country'].split(',').length >= 2
      end

      def aggregate_film_rating(film, info)
        info[:rating] += film['rating_kinopoisk'].to_f
        info[:amount] += 1
        info
      end
    end
  end
end

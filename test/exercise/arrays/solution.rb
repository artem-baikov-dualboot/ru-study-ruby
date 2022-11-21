module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max()
        array.map { |element| element.positive? ? max : element }
      end

      def search(array, query)
        binary_search(array, 0, array.length - 1, query)
      end

      private

      def binary_search(array, first_index, last_index, query)
        if first_index < last_index
          middle_index = (first_index + last_index) / 2
          if query > array[middle_index]
            binary_search(array, middle_index + 1, last_index, query)
          elsif query < array[middle_index]
            binary_search(array, first_index, middle_index - 1, query)
          else
            middle_index
          end
        elsif first_index == last_index
          array[first_index] == query ? first_index : -1
        else
          -1
        end
      end
    end
  end
end

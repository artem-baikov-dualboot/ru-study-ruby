module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max()
        array.map { |element| element.positive? ? max : element }
      end

      def search(_array, _query)
        0
      end
    end
  end
end

module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return self unless block_given?

        for element in self do
          yield(element)
        end
      end

      # Написать свою функцию my_map
      def my_map; end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        return acc unless block_given?

        start_index = 0

        if acc.nil?
          acc = self[0]
          start_index = 1
        end

        for element in self[start_index..] do
          acc = yield(acc, element)
        end

        acc
      end
    end
  end
end

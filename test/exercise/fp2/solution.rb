module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self unless block_given?

        my_foreach(self, &block)
      end

      # Написать свою функцию my_map
      def my_map
        return self unless block_given?

        my_reduce(MyArray.new) { |acc, element| acc.push(yield(element)) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, element| element.nil? ? acc : acc.push(element) }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc unless block_given?

        start_index = 0

        if acc.nil?
          acc = self[0]
          start_index = 1
        end

        reduce_array(acc, self[start_index..], &block)
      end

      private

      def my_foreach(array, &block)
        head, *tail = array

        yield(head)

        if tail.length.zero?
          [head]
        else
          [head] + my_foreach(tail, &block)
        end
      end

      def reduce_array(acc, array, &block)
        head, *tail = array

        acc = yield(acc, head)

        if tail.length.zero?
          acc
        else
          reduce_array(acc, tail, &block)
        end
      end
    end
  end
end

module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self unless block_given?

        head, *tail = self

        yield(head)

        tail.length.zero? ? [head] : [head] + MyArray.new(tail).my_each(&block)
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

        head, *tail = self

        acc = acc.nil? ? head : yield(acc, head)

        tail.length.zero? ? acc : MyArray.new(tail).my_reduce(acc, &block)
      end
    end
  end
end

 class Stack
    attr_reader :first_stack
    def initialize
      first_stack = []
    end

    def push(el)
      first_stack << el
    end

    def pop
      first_stack.pop
    end

    def peek
      first_stack[-1]
    end
  end

  class Queue
    attr_reader :line

    def initialize
        line = []
    end

    def enqueue(el)
        line << el
    end

    def dequeue
        line.pop
    end

    def peek
        line[-1]
    end

  end


  class Map
    attr_reader :dictionary
    def initialize
        @dictionary = []
    end

    def set(key,value)
        (0...@dictionary.length).each do |idx|
            if dictionary[idx][0] == key
                dictionary[idx][1] = value
                return
            end
        end

        @dictionary << [key, value]
    end

    def get(key)
        @dictionary.each do |pair|
           return pair[1] if pair[0] == key
        end
        nil
    end

    def delete(key)
        @dictionary.reject! { |pair| pair[0] == key}
    end

    def show
        print @dictionary
    end
  end

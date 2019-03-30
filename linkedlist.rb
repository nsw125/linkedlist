class LinkedList

    def initialize
        @head = Node.new(1)
    end

    def head
        puts @head.data
    end

    def append(new_data)
        current_node = @head
        while current_node.pointer != nil
            current_node = current_node.pointer
        end
        new_node = Node.new(new_data)
        current_node.set_pointer(new_node)

    end
    
    def prepend(new_data)
        current_node = @head
        new_node = Node.new(new_data)
        new_node.set_pointer(current_node)
        @head = new_node
    end

    def size
        current_node = @head
        count = 0
        while current_node != nil
            count += 1
            current_node = current_node.pointer
        end
        puts "#{count} item(s)!"
    end

    def tail
        current_node = @head
        while current_node.pointer != nil
            current_node = current_node.pointer
        end
        puts current_node.data
    end

    def at(index)
        current_node = @head
        (index - 1).times do 
            current_node = current_node.pointer
        end
        puts current_node.data
    end

    def pop
        current_node = @head
        new_end = @head
        while current_node.pointer != nil
            new_end = current_node
            current_node = current_node.pointer
        end
        new_end.set_pointer(nil)
    end

    def contains?(item)
        result = false
        current_node = @head
        while current_node != nil
            if current_node.data == item
                result = true
            end
            current_node = current_node.pointer
        end
        puts result
    end

    def find(item)
        result = false
        current_node = @head
        counter = 0
        until current_node == nil or result == true
            if current_node.data == item
                result = true
            end
            current_node = current_node.pointer
            counter += 1
        end
        puts counter
    end

    def to_s
        current_node = @head
        result = ""
        while current_node != nil
            print "( #{current_node.data} ) -> "
            current_node = current_node.pointer
        end
        if current_node == nil
            print "nil"
        end
        puts 
    end

    def insert_at(data, index)
        first_node = @head
        (index - 2).times do
            first_node = first_node.pointer
        end
        second_node = first_node.pointer
        new_node = Node.new(data)
        first_node.set_pointer(new_node)
        new_node.set_pointer(second_node)

    end

    def remove_at(index)
        current_node = @head
        (index - 2).times do
            current_node = current_node.pointer
        end
        removed_node = current_node.pointer
        current_node.set_pointer(removed_node.pointer)
    end
end

class Node

    attr_accessor :data, :pointer

    def initialize(data, pointer = nil)
        @data = data
        @pointer = pointer
    end

    def set_pointer(node)
        @pointer = node
    end

end

new_list = LinkedList.new
puts "New list!"
new_list.to_s
puts
(2..10).each { |x| new_list.append(x) }
puts "Let's add some more numbers!" 
new_list.to_s
puts
new_list.prepend(0)
puts "Let's add one to the front!"
new_list.to_s
puts
puts "How big is our linked list now?"
new_list.size
puts
puts "Who's the lead item here??"
new_list.head
puts
puts "Who's at the end?"
new_list.tail
puts
puts "Who is in the fourth spot on our list??"
new_list.at(4)
puts
puts "Let's get rid of that last number!"
new_list.pop
new_list.to_s
puts
puts "Does this list contain a 9?"
new_list.contains?(9)
puts
puts "How about an 11?"
new_list.contains?(11)
puts
puts "What position is a 6?"
new_list.find(6)
new_list.to_s
puts
puts "How about we mix things up? insert a K in the 7th spot."
new_list.insert_at('k', 7)
new_list.to_s

puts "Let's get rid of something now, how about that 4!"
new_list.remove_at(5)
new_list.to_s
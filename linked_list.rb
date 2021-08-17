class LinkedList
    def initialize()
      @head = nil
    end

    def find_last_node
        node = @head
        return node if node.next.nil?
        return node if node.next.nil? while(node= node.next)
    end

    def traversal()
        if @head
            node = @head
            nodes = []
            nodes.push(node)
            nodes.push(node) while(node = node.next)
            nodes.each { |node| puts "value: #{node.value}, next: #{node.next}" }
            return nodes
        end
    end

    def insert_start(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            first_node = @head
            @head = new_node
            @head.next = first_node 
        end
        puts 'New node added to the head'
        return new_node
    end

    def insert_end(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            last_node = find_last_node()
            last_node.next = new_node
        end
        puts 'New node added to the last node'
        return new_node
    end

    def insert_after(pre_value,value)
        return if @head.nil?
        new_node = Node.new(value)
        pre_node = find_node(pre_value)
        if pre_node 
            if !pre_node.next.nil?
                post_node = pre_node.next
                new_node.next = post_node
            end
            pre_node.next = new_node
            puts "LinkedList updated. new node added between #{pre_node.value} and #{post_node.value if post_node}"
            return new_node,pre_node
        else
            puts 'Node not found'
            return
        end
    end

    def find_node(value)
        return @head if @head.value == value
        node = @head
        return node if node.value == value while(node = node.next)
    end

    def delete(value)
        return if @head.nil?
        if @head.value == value
            node = @head
            post_node = @head.next 
            @head = post_node
            puts "Node with value #{value} successfully deleted"
            return node
        end
        node, pre_node = find_node_and_pre_node(value)
        if node.nil?
            puts "Node not found"
            return
        end
        post_node = node.next ? node.next : nil
        pre_node.next = post_node
        puts "Node with value #{value} successfully deleted"
        return node
    end

    def find_node_and_pre_node(value)
        node = @head
        pre_node = node
        while(node = node.next)
            if node.value == value
                return node,pre_node
            end
            pre_node = node
        end
    end
end

class Node  
    attr_accessor :value,:next

    def initialize(value)
      @value = value
      @next = nil
    end
end


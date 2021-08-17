require_relative '../linked_list.rb'

describe LinkedList do 

    before(:each) do
        @linkedList = LinkedList.new
    end

    before(:all) do
        puts 'Tests completed'
    end

    def add_dummy_data()
        (1..3).each { |value|  @linkedList.insert_end(value) }
        return (1..3).to_a
    end

    it 'insert_start method should add a new node to the beginning of Linked List' do 
        expect(@linkedList.insert_start(1).value).to eq(1)
    end

    it 'insert_end method should add a new node to the ending of Linked List' do 
        node = @linkedList.insert_end(1)
        expect(node.value).to eq(1)
        expect(node.next).to be_nil
    end

    it 'insert_after method should add a new node after the specified node' do 
        add_dummy_data()
        new_node,pre_node = @linkedList.insert_after(1,2)
        expect(new_node.value).to eq(2)
        expect(pre_node.value).to eq(1)
        expect(pre_node.next.object_id).to eql(new_node.object_id)
    end

    it 'find_node(search) method should find a node with specified value' do 
        add_dummy_data()
        node = @linkedList.find_node(3)
        expect(node.value).to eq(3)
    end

    it 'delete method should delete a node with specified value' do 
        add_dummy_data()
        node = @linkedList.delete(3)
        expect(node.value).to eq(3)
    end

    it 'traversal method should return hash of nodes in LinkedList' do
        values = add_dummy_data()
        nodes = @linkedList.traversal
        nodes.each_with_index do |node,i| 
            expect(node.value).to be(values[i])
        end
    end

    

end 

#comment for new branch
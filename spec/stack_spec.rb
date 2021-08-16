require_relative '../stack.rb'

describe Stack do 

    before(:each) do
        @stack = Stack.new
    end

    before(:all) do
        puts 'Tests completed'
    end

    def stack_with_element
        a = 1
        @stack.push(a)
        return a
    end

    it 'push method should add an element to stack' do 
        stack_with_element()
        expect(@stack.peek).to eq(1)
    end

    it 'pop method should remove an element from stack' do 
        a  = stack_with_element()
        expect(@stack.pop).to eq(a)
    end

    it 'peek method should return the top element of stack' do 
        a  = stack_with_element()
        expect(@stack.peek).to eq(a)
    end

    it 'size method should return the size of stack' do
        stack_with_element()
        expect(@stack.size).to eq(1)
    end

    it 'is_empty method should return true if stack is empty' do
        stack = Stack.new
        expect(stack.is_empty?).to be true
    end

end 
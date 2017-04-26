

class LinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def  valid index
    raise IndexError  if  not (0...size).include? index
  end
  

  def append(value)
    node  = Node.create(value)
    if @size == 0
      @head = @tail =  node
    else
    @tail.next = node
    @tail = node
   end
    @size +=1
  end


  def prepend(value)
    node  = Node.create(value)
    if @size == 0
        @head = @tail =  node
    else
        node.next  = @head
        @head = node
    end
     @size+=1
  end

  def at_node(index)
    valid(index)
    node = @head
    (index).times{ node = node.next }
    node
  end

   def at(index)
     at_node(index).value
   end

  def contains? value
    node = @head
    while !node.nil? and  node.value != value
      node = node.next
   end
   !node.nil?
 end


 def find value
   node = @head
   i = 0
   while  !node.nil? and node.value != value
    node = node.next
    i+=1
  end
  node.nil? ? nil : i
end



def insert_at(index,value)
  valid(index)
  if index >= 1
    node = at_node(index - 1 )
    new_node = Node.create(value,node.next)
    node.next = new_node
  else
    prepend(value)
  end
 @size+=1
end


def remove_at(index)
  valid( index)
  before = at_node(index)
  if index ==  size - 1
    @tail = before
    before.next = nil
  elsif index == 0
    @head = @head.next
  else
    after = before.next.next
    before.next = after
  end
  @size-=1
end



def to_s
  node = @head
  s = ""
  while  !node.nil?
    s += node.to_s
    node = node.next
  end
  s += "nil"
end

end




class Node
 attr_accessor :value , :next

 class << self
  def create(value,n = nil)
    new(value,n)
  end
end

  def initialize(value,n= nil)
    @value = value
    @next  = n
  end

  def to_s
    %Q[(#{@value})->]
  end
end
